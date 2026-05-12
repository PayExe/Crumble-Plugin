shader_type canvas_item;
uniform float flicker_intensity : hint_range(0.0, 0.1) = 0.02;

float rand(vec2 co) {
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    float flick = 1.0 - rand(vec2(floor(TIME * 24.0), 0.0)) * flicker_intensity;
    COLOR.rgb *= flick;
}