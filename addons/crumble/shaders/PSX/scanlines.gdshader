shader_type canvas_item;
uniform bool scanlines = true;
uniform float scanline_intensity : hint_range(0.0, 1.0) = 0.15;

void fragment() {
	    if (scanlines) {
        float scan = sin(FRAGCOORD.y * 3.14159) * 0.5 + 0.5;
        COLOR.rgb *= 1.0 - scanline_intensity * (1.0 - scan);
    }
}
