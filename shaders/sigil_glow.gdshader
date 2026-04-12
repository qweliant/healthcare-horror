shader_type spatial;
render_mode unshaded;

uniform vec4 base_color : source_color = vec4(0.6, 0.1, 0.1, 1.0);
uniform float glow_intensity : hint_range(0.0, 8.0) = 1.0;
uniform float pulse_speed : hint_range(0.0, 4.0) = 1.5;
uniform float pulse_amount : hint_range(0.0, 1.0) = 0.3;

void fragment() {
	float pulse = 1.0 + sin(TIME * pulse_speed) * pulse_amount;
	ALBEDO = base_color.rgb * glow_intensity * pulse;
	EMISSION = base_color.rgb * glow_intensity * pulse;
}
