shader_type canvas_item;
uniform float noise_intensity : hint_range(0.0, 1.0) = 0.08;

float rand(vec2 co) {
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = SCREEN_UV;
    float noise_line = rand(vec2(floor(uv.y * 80.0), floor(TIME * 8.0)));
    if (noise_line > 0.97) {
        uv.x += (rand(vec2(TIME, uv.y)) - 0.5) * noise_intensity;
    }
    COLOR = texture(TEXTURE, uv);
}