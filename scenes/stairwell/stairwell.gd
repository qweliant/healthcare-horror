extends Node3D

## Looping stairwell escape scene for job 2.
## Player walks up stairs, gets teleported back after reaching the top.
## After several loops the realization dialogue plays, then phone calls, then job3.

@onready var dialogue_box: CanvasLayer = $DialogueBox
@onready var player: CharacterBody3D = $Player
@onready var teleport_zone: Area3D = $TeleportZone
@onready var spawn_point: Marker3D = $SpawnPoint

var loops_completed := 0
var loops_required := 3
var escape_triggered := false


func _ready() -> void:
	GameManager.player = player
	dialogue_box.add_to_group("dialogue_box")

	teleport_zone.body_entered.connect(_on_teleport_entered)

	TransitionOverlay.hold_black()
	await get_tree().create_timer(0.5).timeout
	TransitionOverlay.fade_in(1.5)
	await TransitionOverlay.fade_in_finished

	# Brief entrance dialogue
	GameManager.start_dialogue("stairwell_enter")
	dialogue_box.dialogue_finished.connect(_on_enter_finished, CONNECT_ONE_SHOT)


func _on_enter_finished() -> void:
	# Player is free to walk up the stairs
	pass


func _on_teleport_entered(body: Node3D) -> void:
	if body != player or escape_triggered:
		return

	loops_completed += 1

	if loops_completed >= loops_required:
		_trigger_escape()
	else:
		# Silently teleport back to bottom
		_teleport_player()


func _teleport_player() -> void:
	player.velocity = Vector3.ZERO
	player.global_position = spawn_point.global_position


func _trigger_escape() -> void:
	escape_triggered = true
	player.freeze()

	# Brief flash to disorient
	TransitionOverlay.flash_color(Color(0.1, 0.1, 0.1, 1), 0.3)
	await get_tree().create_timer(0.5).timeout

	# Teleport back so the player is "at the landing" for the dialogue
	_teleport_player()

	GameManager.start_dialogue("stairwell_loop")
	dialogue_box.dialogue_finished.connect(_on_loop_finished, CONNECT_ONE_SHOT)


func _on_loop_finished() -> void:
	# "Your phone buzzes" — start the bill call
	await get_tree().create_timer(1.5).timeout
	_start_bill_call()


func _start_bill_call() -> void:
	GameManager.set_state(GameManager.GameState.JOB_PHONE_CALL)
	var key := "job_bill_call_1"
	if DialogueData.dialogues.has(key):
		GameManager.start_dialogue(key)
		dialogue_box.dialogue_finished.connect(_on_bill_call_finished, CONNECT_ONE_SHOT)
	else:
		_on_bill_call_finished()


func _on_bill_call_finished() -> void:
	await get_tree().create_timer(2.0).timeout
	_start_next_call()


func _start_next_call() -> void:
	var key := "job_next_call_1"
	if DialogueData.dialogues.has(key):
		GameManager.start_dialogue(key)
		dialogue_box.dialogue_finished.connect(_on_next_call_finished, CONNECT_ONE_SHOT)
	else:
		_on_next_call_finished()


func _on_next_call_finished() -> void:
	# Same as job2.gd's override — skip car ride, go directly to job3
	GameManager.advance_job()
	TransitionOverlay.fade_out(1.5)
	await TransitionOverlay.fade_out_finished
	await get_tree().create_timer(3.0).timeout
	GameManager.transition_to_scene("res://scenes/job3/job3.tscn")
