shader_type canvas_item;
uniform bool dithering = true;
uniform int colors : hint_range(1, 16) = 12;
uniform int dither_size : hint_range(1, 8) = 1;

#define MAXCOLORS 16

float dithering_pattern(ivec2 fragcoord) {
    const float pattern[] = {
        0.00, 0.50, 0.10, 0.65,
        0.75, 0.25, 0.90, 0.35,
        0.20, 0.70, 0.05, 0.50,
        0.95, 0.40, 0.80, 0.30
    };
    int x = fragcoord.x % 4;
    int y = fragcoord.y % 4;
    return pattern[y * 4 + x];
}

float reduce_color(float raw, float dither, int depth) {
    depth = max(depth, 2);
    float div = 1.0 / float(depth);
    float val = 0.0;
    for (int i = 0; i < MAXCOLORS; i++) {
        if (raw > div * float(i + 1)) { continue; }
        val = (raw * float(depth) - float(i) <= dither * 0.999)
            ? div * float(i)
            : div * float(i + 1);
        return val;
    }
    return val;
}

void fragment() {
    vec4 raw = texture(TEXTURE, SCREEN_UV);
    ivec2 uv = ivec2(FRAGCOORD.xy / float(dither_size));
    float dithering_value = dithering ? dithering_pattern(uv) : 1.0;
    COLOR.r = reduce_color(raw.r, (dithering_value - 0.5) * dithering_value + 0.5, colors - 1);
    COLOR.g = reduce_color(raw.g, (dithering_value - 0.5) * dithering_value + 0.5, colors - 1);
    COLOR.b = reduce_color(raw.b, (dithering_value - 0.5) * dithering_value + 0.5, colors - 1);
}