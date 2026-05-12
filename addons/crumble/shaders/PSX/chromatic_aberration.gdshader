shader_type canvas_item;
uniform float aberration_amount : hint_range(0.0, 0.02) = 0.005;

void fragment() {
    vec2 uv = SCREEN_UV;
    vec2 offset = vec2(aberration_amount, 0.0);
    COLOR.r = texture(TEXTURE, uv + offset).r;
    COLOR.g = texture(TEXTURE, uv).g;
    COLOR.b = texture(TEXTURE, uv - offset).b;
    COLOR.a = 1.0;
}