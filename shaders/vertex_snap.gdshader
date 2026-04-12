shader_type spatial;
render_mode unshaded;

// PS1-style vertex snapping and affine texture mapping
uniform sampler2D albedo_tex : source_color;
uniform vec4 albedo_color : source_color = vec4(1.0);
uniform float snap_strength : hint_range(1.0, 10.0) = 3.0;

void vertex() {
	// Standard MVP
	vec4 clip_pos = PROJECTION_MATRIX * MODELVIEW_MATRIX * vec4(VERTEX, 1.0);

	// Snap vertices to a grid in clip space (PS1 jitter)
	float grid = snap_strength * 100.0;
	clip_pos.xyz = clip_pos.xyz / clip_pos.w;
	clip_pos.xy = floor(clip_pos.xy * grid + 0.5) / grid;
	clip_pos.xyz *= clip_pos.w;

	POSITION = clip_pos;
}

void fragment() {
	vec4 tex = texture(albedo_tex, UV);
	ALBEDO = tex.rgb * albedo_color.rgb;
}
