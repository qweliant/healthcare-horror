extends JobSiteBase

@onready var flicker_light: OmniLight3D = $FlickerLight
@onready var cultist_a: StaticBody3D = $Cultist1
@onready var cultist_b: StaticBody3D = $Cultist2
@onready var dead_cultist_a: Node3D = $DeadCultists/DeadCultist1
@onready var dead_cultist_b: Node3D = $DeadCultists/DeadCultist2


func _setup_environment() -> void:
	AudioManager.play_ambient("people_hum", 2.0, -16.0)


func _process(delta: float) -> void:
	if flicker_light:
		if randf() < 0.035:
			flicker_light.light_energy = randf_range(0.04, 0.25)
		else:
			flicker_light.light_energy = lerpf(flicker_light.light_energy, 0.45, delta * 3.0)


func _on_ritual_finished() -> void:
	_apply_cultist_casualties()
	AudioManager.play_sfx("ambient_scrape", -2.0)
	super._on_ritual_finished()


func _apply_cultist_casualties() -> void:
	for c in [cultist_a, cultist_b]:
		if c:
			c.visible = false
			c.collision_layer = 0
			c.collision_mask = 0
	if dead_cultist_a:
		dead_cultist_a.visible = true
	if dead_cultist_b:
		dead_cultist_b.visible = true
