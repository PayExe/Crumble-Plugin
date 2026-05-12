shader_type canvas_item;
uniform float vignette_intensity : hint_range(0.0, 2.0) = 1.2;
uniform float vignette_danger : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec2 uv = SCREEN_UV;
    vec2 vig_uv = uv * (1.0 - uv.yx);
    float vig = vig_uv.x * vig_uv.y * 15.0;
    vig = pow(vig, vignette_intensity);
    float danger = vignette_danger;
    COLOR.rgb *= mix(vec3(vig), vec3(vig * (1.0 - danger * 0.5), vig * (1.0 - danger), vig * (1.0 - danger)), danger);
}