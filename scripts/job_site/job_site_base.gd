class_name JobSiteBase
extends Node3D

## Base class for all job site scenes. Handles the shared lifecycle:
## arrive → meet group → explore/interact → ritual → aftermath → phone calls.

@onready var dialogue_box: CanvasLayer = $DialogueBox
@onready var player: CharacterBody3D = $Player
@onready var ps1_overlay: ColorRect = $PS1Overlay
@onready var ritual_sequence: Node3D = $RitualSequence

var job_index: int = 0
var meeting_complete := false
var ritual_triggered := false


func _ready() -> void:
	job_index = GameManager.current_job
	GameManager.player = player
	dialogue_box.add_to_group("dialogue_box")
	_setup_environment()
	_start_arrival()


func _setup_environment() -> void:
	# Override in subclasses for job-specific lighting, fog, etc.
	pass


func _start_arrival() -> void:
	GameManager.set_state(GameManager.GameState.JOB_ARRIVING)
	TransitionOverlay.hold_black()
	await get_tree().create_timer(0.5).timeout
	TransitionOverlay.fade_in(2.0)
	await TransitionOverlay.fade_in_finished

	# Play arrival dialogue then move to meeting
	var key := _get_arrival_dialogue_key()
	if DialogueData.dialogues.has(key):
		GameManager.start_dialogue(key)
		dialogue_box.dialogue_finished.connect(_on_arrival_finished, CONNECT_ONE_SHOT)
	else:
		_start_meeting()


func _on_arrival_finished() -> void:
	await get_tree().create_timer(1.0).timeout
	_start_meeting()


func _start_meeting() -> void:
	GameManager.set_state(GameManager.GameState.JOB_MEETING)
	var key := _get_meeting_dialogue_key()
	if DialogueData.dialogues.has(key):
		GameManager.start_dialogue(key)
		dialogue_box.dialogue_finished.connect(_on_meeting_finished, CONNECT_ONE_SHOT)
	else:
		_on_meeting_finished()


func _on_meeting_finished() -> void:
	meeting_complete = true
	GameManager.set_state(GameManager.GameState.JOB_EXPLORING)
	# Player is now free to explore and talk to NPCs before triggering the ritual


func start_ritual() -> void:
	if ritual_triggered:
		return
	ritual_triggered = true
	GameManager.set_state(GameManager.GameState.JOB_RITUAL)
	if player:
		player.freeze()
	if ritual_sequence:
		ritual_sequence.start_sequence(job_index)
		ritual_sequence.sequence_finished.connect(_on_ritual_finished, CONNECT_ONE_SHOT)


func _on_ritual_finished() -> void:
	_start_aftermath()


func _start_aftermath() -> void:
	GameManager.set_state(GameManager.GameState.JOB_AFTERMATH)
	GameManager.complete_job()

	var key := _get_aftermath_dialogue_key()
	if DialogueData.dialogues.has(key):
		GameManager.start_dialogue(key)
		dialogue_box.dialogue_finished.connect(_on_aftermath_finished, CONNECT_ONE_SHOT)
	else:
		_on_aftermath_finished()


func _on_aftermath_finished() -> void:
	await get_tree().create_timer(1.5).timeout
	_try_escape_attempt()


func _try_escape_attempt() -> void:
	var key := _get_escape_dialogue_key()
	if key != "" and DialogueData.dialogues.has(key):
		GameManager.set_state(GameManager.GameState.JOB_ESCAPE_ATTEMPT)
		GameManager.start_dialogue(key)
		dialogue_box.dialogue_finished.connect(_on_escape_finished, CONNECT_ONE_SHOT)
	else:
		_start_bill_call()


func _on_escape_finished() -> void:
	await get_tree().create_timer(1.5).timeout
	_start_bill_call()


func _get_escape_dialogue_key() -> String:
	if job_index <= 1:
		return "job_escape_%d" % job_index
	return ""


func _start_bill_call() -> void:
	GameManager.set_state(GameManager.GameState.JOB_PHONE_CALL)
	var key := "job_bill_call_%d" % job_index
	if DialogueData.dialogues.has(key):
		GameManager.start_dialogue(key)
		dialogue_box.dialogue_finished.connect(_on_bill_call_finished, CONNECT_ONE_SHOT)
	else:
		_on_bill_call_finished()


func _on_bill_call_finished() -> void:
	if GameManager.has_more_jobs():
		await get_tree().create_timer(2.0).timeout
		_start_next_job_call()
	else:
		# Final job done — future ending goes here
		await get_tree().create_timer(2.0).timeout
		print("ALL JOBS COMPLETE - Ending not yet implemented")


func _start_next_job_call() -> void:
	var key := "job_next_call_%d" % job_index
	if DialogueData.dialogues.has(key):
		GameManager.start_dialogue(key)
		dialogue_box.dialogue_finished.connect(_on_next_call_finished, CONNECT_ONE_SHOT)
	else:
		_on_next_call_finished()


func _on_next_call_finished() -> void:
	GameManager.advance_job()
	GameManager.set_state(GameManager.GameState.CAR_RIDE)
	TransitionOverlay.fade_out(1.5)
	await TransitionOverlay.fade_out_finished
	GameManager.transition_to_scene("res://scenes/car_ride/car_ride.tscn")


# -- Dialogue key hooks (override for custom naming) --

func _get_arrival_dialogue_key() -> String:
	return "job_arrival_%d" % job_index

func _get_meeting_dialogue_key() -> String:
	return "job_meeting_%d" % job_index

func _get_aftermath_dialogue_key() -> String:
	return "job_aftermath_%d" % job_index
