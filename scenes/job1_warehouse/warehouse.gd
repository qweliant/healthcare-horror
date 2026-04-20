extends JobSiteBase

@onready var flicker_light: OmniLight3D = $FlickerLight


func _setup_environment() -> void:
	AudioManager.play_ambient("people_hum", 2.0, -14.0)


func _process(delta: float) -> void:
	# Flickering warehouse light
	if flicker_light:
		if randf() < 0.03:
			flicker_light.light_energy = randf_range(0.05, 0.3)
		else:
			flicker_light.light_energy = lerpf(flicker_light.light_energy, 0.6, delta * 3.0)
