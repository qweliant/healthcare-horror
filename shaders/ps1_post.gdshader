shader_type canvas_item;

// PS1-style post-processing: pixelation + color banding + subtle dither
uniform sampler2D screen_texture : hint_screen_texture, filter_nearest;
uniform float color_depth : hint_range(2.0, 32.0) = 15.0;
uniform float dither_strength : hint_range(0.0, 1.0) = 0.05;

float dither_matrix(vec2 pos) {
	int x = int(pos.x) % 4;
	int y = int(pos.y) % 4;
	int index = x + y * 4;
	float val = 0.0;
	// 4x4 Bayer matrix
	if (index == 0) val = 0.0;
	else if (index == 1) val = 8.0;
	else if (index == 2) val = 2.0;
	else if (index == 3) val = 10.0;
	else if (index == 4) val = 12.0;
	else if (index == 5) val = 4.0;
	else if (index == 6) val = 14.0;
	else if (index == 7) val = 6.0;
	else if (index == 8) val = 3.0;
	else if (index == 9) val = 11.0;
	else if (index == 10) val = 1.0;
	else if (index == 11) val = 9.0;
	else if (index == 12) val = 15.0;
	else if (index == 13) val = 7.0;
	else if (index == 14) val = 13.0;
	else if (index == 15) val = 5.0;
	return val / 16.0 - 0.5;
}

void fragment() {
	vec4 col = texture(screen_texture, SCREEN_UV);

	// Dither
	float dither = dither_matrix(FRAGCOORD.xy) * dither_strength;
	col.rgb += dither;

	// Color banding / quantize
	col.rgb = floor(col.rgb * color_depth + 0.5) / color_depth;

	COLOR = col;
}
