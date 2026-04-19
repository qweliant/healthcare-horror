extends Node3D

@onready var dialogue_box: CanvasLayer = $DialogueBox
@onready var player: CharacterBody3D = $Player
@onready var ps1_overlay: ColorRect = $PS1Overlay
@onready var lamp1: OmniLight3D = $Lamp1/LampLight
@onready var lamp2: OmniLight3D = $Lamp2/LampLight

## The first job to play after the opening car ride. Seeds the pending_*
## state on GameManager so car_ride.gd knows which scene to load.
@export var first_job_scene: PackedScene
@export var first_job_index: int = 0

var car_interacted := false


func _ready() -> void:
	GameManager.player = player
	dialogue_box.add_to_group("dialogue_box")
	GameManager.set_state(GameManager.GameState.PARKING_LOT)

	TransitionOverlay.hold_black()
	await get_tree().create_timer(0.5).timeout
	TransitionOverlay.fade_in(2.0)
	await TransitionOverlay.fade_in_finished


func _process(delta: float) -> void:
	for lamp in [lamp1, lamp2]:
		if lamp:
			if randf() < 0.04:
				lamp.light_energy = randf_range(0.05, 0.3)
			else:
				lamp.light_energy = lerpf(lamp.light_energy, 1.2, delta * 3.0)


func on_car_interacted() -> void:
	if car_interacted:
		return
	car_interacted = true

	GameManager.start_dialogue("parking_lot_car_enter")
	dialogue_box.dialogue_finished.connect(_on_car_enter_finished, CONNECT_ONE_SHOT)


func _on_car_enter_finished() -> void:
	await get_tree().create_timer(1.0).timeout
	GameManager.start_dialogue("parking_lot_car_start")
	dialogue_box.dialogue_finished.connect(_on_car_start_finished, CONNECT_ONE_SHOT)


func _on_car_start_finished() -> void:
	await get_tree().create_timer(1.5).timeout
	GameManager.set_state(GameManager.GameState.PHONE_CALL)
	GameManager.start_dialogue("phone_call")
	dialogue_box.dialogue_finished.connect(_on_phone_finished, CONNECT_ONE_SHOT)


func _on_phone_finished() -> void:
	GameManager.start_dialogue("parking_lot_waiting")
	dialogue_box.dialogue_finished.connect(_on_waiting_finished, CONNECT_ONE_SHOT)


func _on_waiting_finished() -> void:
	await get_tree().create_timer(2.0).timeout
	GameManager.set_state(GameManager.GameState.CAR_RIDE)

	if first_job_scene:
		GameManager.pending_job_scene = first_job_scene
		GameManager.pending_job_index = first_job_index

	TransitionOverlay.fade_out(1.5)
	await TransitionOverlay.fade_out_finished
	GameManager.transition_to_scene("res://scenes/car_ride/car_ride.tscn")
