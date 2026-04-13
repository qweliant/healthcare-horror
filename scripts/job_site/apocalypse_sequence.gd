extends Node3D

## Apocalyptic ritual sequence for Job 3. Same interface as RitualSequence:
## start_sequence(job_index) + signal sequence_finished.

signal sequence_finished

@onready var sigil_light: OmniLight3D = $SigilLight
@onready var sigil_mesh: CSGCylinder3D = $Sigil
@onready var cryptic_overlay: CanvasLayer = $"../CrypticOverlay"
@onready var cryptic_label: Label = $"../CrypticOverlay/CrypticLabel"
@onready var demons_parent: Node3D = $"../Demons"
@onready var lava_parent: Node3D = $"../LavaGroup"

var _camera_shake_active := false
var _shake_intensity := 0.0
var _camera_origin := Vector3.ZERO


func _ready() -> void:
	if sigil_light:
		sigil_light.light_energy = 0.0
	if sigil_mesh and sigil_mesh.material:
		sigil_mesh.material.set_shader_parameter("glow_intensity", 0.0)
	if cryptic_overlay:
		cryptic_overlay.visible = false
	if demons_parent:
		demons_parent.visible = false
	if lava_parent:
		lava_parent.visible = false


func _process(_delta: float) -> void:
	if _camera_shake_active and GameManager.player:
		var cam: Camera3D = GameManager.player.get_node_or_null("Camera3D")
		if cam:
			cam.position = Vector3(
				_camera_origin.x + randf_range(-_shake_intensity, _shake_intensity),
				_camera_origin.y + randf_range(-_shake_intensity * 0.5, _shake_intensity * 0.5),
				_camera_origin.z
			)


func start_sequence(_job_index: int) -> void:
	await _phase_glow_buildup()
	await _phase_ritual_dialogue()
	await _phase_cryptic_flashes()
	await _phase_demons_and_lava()
	await _phase_final_whiteout()
	sequence_finished.emit()


func _phase_glow_buildup() -> void:
	var tween := create_tween().set_parallel(true)
	if sigil_light:
		tween.tween_property(sigil_light, "light_energy", 8.0, 5.0)
	if sigil_mesh and sigil_mesh.material:
		tween.tween_method(
			func(v: float) -> void: sigil_mesh.material.set_shader_parameter("glow_intensity", v),
			0.0, 6.0, 5.0
		)
	await tween.finished


func _phase_ritual_dialogue() -> void:
	if not DialogueData.dialogues.has("job_ritual_2"):
		return
	GameManager.start_dialogue("job_ritual_2")
	var db := get_tree().get_first_node_in_group("dialogue_box")
	if db:
		await db.dialogue_finished


func _phase_cryptic_flashes() -> void:
	if GameManager.player:
		var cam: Camera3D = GameManager.player.get_node_or_null("Camera3D")
		if cam:
			_camera_origin = cam.position
	_camera_shake_active = true
	_shake_intensity = 0.008

	var messages: Array[Dictionary] = [
		{"text": "YOU CHOSE THIS",              "color": Color(0.9, 0.05, 0.05, 1)},
		{"text": "THE GATE IS OPEN",            "color": Color(0.7, 0.0,  0.9,  1)},
		{"text": "THERE IS NO LEAVING",         "color": Color(0.05, 0.05, 0.8, 1)},
		{"text": "$247,893",                    "color": Color(1.0,  1.0,  1.0,  1)},
		{"text": "THIS IS WHAT YOU AGREED TO",  "color": Color(0.9, 0.05, 0.05, 1)},
		{"text": "IT REMEMBERS YOUR NAME",      "color": Color(0.7, 0.0,  0.9,  1)},
		{"text": "THE DEBT IS PAID",            "color": Color(0.05, 0.8,  0.05, 1)},
	]

	cryptic_overlay.visible = true
	for i in messages.size():
		if i == 4:
			_shake_intensity = 0.015
		var msg: Dictionary = messages[i]
		TransitionOverlay.flash_color(msg["color"], 0.4)
		cryptic_label.modulate = Color(1, 1, 1, 1)
		cryptic_label.text = msg["text"]
		await get_tree().create_timer(1.5).timeout
		var fade_tween := create_tween()
		fade_tween.tween_property(cryptic_label, "modulate:a", 0.0, 0.3)
		await fade_tween.finished
		await get_tree().create_timer(0.2).timeout
	cryptic_overlay.visible = false


func _phase_demons_and_lava() -> void:
	if demons_parent:
		demons_parent.visible = true
	if lava_parent:
		lava_parent.visible = true
		var tween := create_tween().set_parallel(true)
		for child in lava_parent.get_children():
			if child is OmniLight3D:
				child.light_energy = 0.0
				tween.tween_property(child, "light_energy", 4.0, 2.0)
		await tween.finished
	await get_tree().create_timer(1.0).timeout


func _phase_final_whiteout() -> void:
	_camera_shake_active = false
	if GameManager.player:
		var cam: Camera3D = GameManager.player.get_node_or_null("Camera3D")
		if cam:
			cam.position = _camera_origin
	TransitionOverlay.flash_color(Color(1, 1, 1, 1), 0.1)
	await TransitionOverlay.flash_finished
	await get_tree().create_timer(0.5).timeout
	TransitionOverlay.fade_out(1.5)
	await TransitionOverlay.fade_out_finished
