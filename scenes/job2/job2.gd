extends JobSiteBase

@onready var flicker_light: OmniLight3D = $FlickerLight
@onready var cultist_a: StaticBody3D = $Cultist1
@onready var cultist_b: StaticBody3D = $Cultist2
@onready var dead_cultist_a: Node3D = $DeadCultists/DeadCultist1
@onready var dead_cultist_b: Node3D = $DeadCultists/DeadCultist2
@onready var escape_door: StaticBody3D = $EscapeDoor


func _process(delta: float) -> void:
	if flicker_light:
		if randf() < 0.035:
			flicker_light.light_energy = randf_range(0.04, 0.25)
		else:
			flicker_light.light_energy = lerpf(flicker_light.light_energy, 0.45, delta * 3.0)


func _on_ritual_finished() -> void:
	_apply_cultist_casualties()
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


func _try_escape_attempt() -> void:
	# Instead of auto-playing escape dialogue, let the player find the door
	GameManager.end_dialogue()
	if escape_door:
		escape_door.escape_enabled = true


func _on_next_call_finished() -> void:
	GameManager.advance_job()
	TransitionOverlay.fade_out(1.5)
	await TransitionOverlay.fade_out_finished
	await get_tree().create_timer(3.0).timeout
	GameManager.transition_to_scene("res://scenes/job3/job3.tscn")
