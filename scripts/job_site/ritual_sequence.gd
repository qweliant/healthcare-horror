class_name RitualSequence
extends Node3D

## Handles the sigil glow → dialogue → screen flash → blackout → bloody fade-in.
## Place as a child of a JobSiteBase scene.

signal sequence_finished

@onready var sigil_light: OmniLight3D = $SigilLight
@onready var sigil_mesh: CSGCylinder3D = $Sigil

var _original_light_energy: float = 0.0


func _ready() -> void:
	if sigil_light:
		_original_light_energy = sigil_light.light_energy
		sigil_light.light_energy = 0.0
	if sigil_mesh and sigil_mesh.material:
		sigil_mesh.material.emission_energy_multiplier = 0.0


func start_sequence(job_index: int) -> void:
	AudioManager.play_sfx("sigil_glow", -2.0)
	await _glow_sigil(3.0)
	if job_index == 0:
		AudioManager.play_ambient("chanting", 0.5, -6.0)
	elif job_index == 1:
		AudioManager.play_sfx("hum_to_shriek", -2.0)
	await _play_ritual_dialogue(job_index)
	AudioManager.stop_ambient(0.4)
	await _blood_flash()
	await _blackout(3.0)
	await _fade_back()
	sequence_finished.emit()


func _glow_sigil(duration: float) -> void:
	var tween := create_tween().set_parallel(true)

	if sigil_light:
		tween.tween_property(sigil_light, "light_energy", 3.0, duration)

	if sigil_mesh and sigil_mesh.material:
		tween.tween_property(sigil_mesh.material, "emission_energy_multiplier", 4.0, duration)

	await tween.finished


func _play_ritual_dialogue(job_index: int) -> void:
	var key := "job_ritual_%d" % job_index
	if not DialogueData.dialogues.has(key):
		return

	GameManager.start_dialogue(key)

	# Wait for dialogue to finish
	var db := get_tree().get_first_node_in_group("dialogue_box")
	if db:
		await db.dialogue_finished


func _blood_flash() -> void:
	TransitionOverlay.flash_color(Color(0.6, 0, 0, 1), 0.3)
	await TransitionOverlay.flash_finished
	await get_tree().create_timer(0.2).timeout
	TransitionOverlay.flash_color(Color(0.8, 0, 0, 1), 0.2)
	await TransitionOverlay.flash_finished


func _blackout(duration: float) -> void:
	TransitionOverlay.fade_out(0.5)
	await TransitionOverlay.fade_out_finished
	await get_tree().create_timer(duration).timeout


func _fade_back() -> void:
	# Reset sigil
	if sigil_light:
		sigil_light.light_energy = _original_light_energy
	if sigil_mesh and sigil_mesh.material:
		sigil_mesh.material.emission_energy_multiplier = 0.0

	TransitionOverlay.fade_in(2.0)
	await TransitionOverlay.fade_in_finished
