extends Node3D

@onready var dialogue_box: CanvasLayer = $DialogueBox
@onready var player: CharacterBody3D = $Player
@onready var player_camera: Camera3D = $Player/Camera3D
@onready var lamp1: OmniLight3D = $Lamp1/LampLight
@onready var lamp2: OmniLight3D = $Lamp2/LampLight

## The first job to play after the opening car ride. Seeds the pending_*
## state on GameManager so car_ride.gd knows which scene to load.
@export var first_job_scene: PackedScene
@export var first_job_index: int = 0
@onready var car_body: CSGBox3D = $PlayerCar/CarBody
@onready var car_roof: CSGBox3D = $PlayerCar/CarRoof
@onready var check_engine_ext: CSGBox3D = $PlayerCar/CheckEngineGlow

@onready var interior_camera: Camera3D = $PlayerCar/Interior/InteriorCamera
@onready var dash_light: OmniLight3D = $PlayerCar/Interior/DashLight
@onready var gas_warning: CSGBox3D = $PlayerCar/Interior/GasWarning
@onready var gas_warning_light: OmniLight3D = $PlayerCar/Interior/GasWarningLight
@onready var battery_gauge: CSGBox3D = $PlayerCar/Interior/BatteryGauge
@onready var check_engine_int: CSGBox3D = $PlayerCar/Interior/CheckEngineInterior
@onready var phone_screen: CSGBox3D = $PlayerCar/Interior/Phone/PhoneScreen
@onready var phone_light: OmniLight3D = $PlayerCar/Interior/Phone/PhoneLight

@onready var sedan: Node3D = $Sedan
@onready var headlight_l: SpotLight3D = $Sedan/HeadlightL
@onready var headlight_r: SpotLight3D = $Sedan/HeadlightR

const DASH_LIGHT_ON := 0.9
const GAS_LIGHT_ON := 0.6

var car_interacted := false
var _click_tween: Tween = null
var _phone_pulse_tween: Tween = null
var _phone_vibrate_timer: Timer = null


func _ready() -> void:
	GameManager.player = player
	dialogue_box.add_to_group("dialogue_box")
	GameManager.set_state(GameManager.GameState.PARKING_LOT)

	player_camera.make_current()
	AudioManager.stop_ambient(0.5)
	AudioManager.stop_layer(0.5)

	TransitionOverlay.hold_black()
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
	_begin_interior_sequence()


func _begin_interior_sequence() -> void:
	player.freeze()
	TransitionOverlay.fade_out(0.8)
	await TransitionOverlay.fade_out_finished

	interior_camera.make_current()
	car_body.visible = false
	car_roof.visible = false
	check_engine_ext.visible = false

	TransitionOverlay.fade_in(1.0)
	await TransitionOverlay.fade_in_finished

	GameManager.start_dialogue("parking_lot_car_enter")
	dialogue_box.dialogue_finished.connect(_on_car_enter_finished, CONNECT_ONE_SHOT)


func _on_car_enter_finished() -> void:
	await get_tree().create_timer(0.6).timeout
	_run_click_sequence()
	GameManager.start_dialogue("parking_lot_car_start")
	dialogue_box.dialogue_finished.connect(_on_car_start_finished, CONNECT_ONE_SHOT)


func _run_click_sequence() -> void:
	if _click_tween and _click_tween.is_valid():
		_click_tween.kill()
	_click_tween = create_tween()
	for i in 3:
		_click_tween.tween_callback(_flicker_dash_once)
		_click_tween.tween_interval(0.7)
	_click_tween.tween_callback(_kill_dash)


func _flicker_dash_once() -> void:
	dash_light.light_energy = 0.1
	gas_warning_light.light_energy = 0.08
	gas_warning.visible = false
	battery_gauge.visible = false
	check_engine_int.visible = false
	await get_tree().create_timer(0.15).timeout
	dash_light.light_energy = DASH_LIGHT_ON
	gas_warning_light.light_energy = GAS_LIGHT_ON
	gas_warning.visible = true
	battery_gauge.visible = true
	check_engine_int.visible = true


func _kill_dash() -> void:
	dash_light.light_energy = 0.0
	gas_warning_light.light_energy = 0.0
	gas_warning.visible = false
	battery_gauge.visible = false
	check_engine_int.visible = false


func _on_car_start_finished() -> void:
	if _click_tween and _click_tween.is_valid():
		_click_tween.kill()
	_kill_dash()

	await get_tree().create_timer(1.2).timeout
	GameManager.set_state(GameManager.GameState.PHONE_CALL)
	_start_phone_pulse()
	GameManager.start_dialogue("phone_call")
	dialogue_box.dialogue_finished.connect(_on_phone_finished, CONNECT_ONE_SHOT)


func _start_phone_pulse() -> void:
	phone_screen.visible = true
	AudioManager.play_sfx("phone_vibrate", -4.0)
	_phone_vibrate_timer = Timer.new()
	_phone_vibrate_timer.wait_time = 0.8
	_phone_vibrate_timer.one_shot = false
	_phone_vibrate_timer.timeout.connect(func() -> void: AudioManager.play_sfx("phone_vibrate", -4.0))
	add_child(_phone_vibrate_timer)
	_phone_vibrate_timer.start()
	_phone_pulse_tween = create_tween().set_loops()
	_phone_pulse_tween.tween_property(phone_light, "light_energy", 2.2, 0.4)
	_phone_pulse_tween.tween_property(phone_light, "light_energy", 0.2, 0.4)


func _stop_phone_pulse() -> void:
	if _phone_pulse_tween and _phone_pulse_tween.is_valid():
		_phone_pulse_tween.kill()
	if _phone_vibrate_timer:
		_phone_vibrate_timer.stop()
		_phone_vibrate_timer.queue_free()
		_phone_vibrate_timer = null
	phone_light.light_energy = 0.0
	phone_screen.visible = false


func _on_phone_finished() -> void:
	_stop_phone_pulse()
	await get_tree().create_timer(0.8).timeout
	_start_sedan_arrival()
	GameManager.start_dialogue("parking_lot_waiting")
	dialogue_box.dialogue_finished.connect(_on_waiting_finished, CONNECT_ONE_SHOT)


func _start_sedan_arrival() -> void:
	sedan.visible = true
	headlight_l.light_energy = 4.0
	headlight_r.light_energy = 4.0
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(sedan, "global_position", Vector3(1.5, 0.5, -13), 4.0)


func _on_waiting_finished() -> void:
	await get_tree().create_timer(1.2).timeout
	GameManager.set_state(GameManager.GameState.CAR_RIDE)

	if first_job_scene:
		GameManager.pending_job_scene = first_job_scene
		GameManager.pending_job_index = first_job_index

	TransitionOverlay.fade_out(1.5)
	await TransitionOverlay.fade_out_finished
	GameManager.transition_to_scene("res://scenes/car_ride/car_ride.tscn")
