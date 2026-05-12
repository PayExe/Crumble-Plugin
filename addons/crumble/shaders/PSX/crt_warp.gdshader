shader_type canvas_item;
uniform float warp_amount : hint_range(0.0, 0.1) = 0.02;

vec2 crt_warp_uv(vec2 uv, float amount) {
    uv = uv * 2.0 - 1.0;
    uv += uv.yx * uv.yx * amount;
    return uv * 0.5 + 0.5;
}

void fragment() {
    vec2 uv = crt_warp_uv(SCREEN_UV, warp_amount);
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        COLOR = vec4(0.0, 0.0, 0.0, 1.0);
    } else {
        COLOR = texture(TEXTURE, uv);
    }
}