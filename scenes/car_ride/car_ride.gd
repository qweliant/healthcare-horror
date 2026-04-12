extends Node3D

## Reusable car ride transition. Reads GameManager.current_job for dialogue and visual intensity.

@onready var camera: Camera3D = $Camera3D
@onready var scrolling_env: Node3D = $ScrollingEnvironment
@onready var dialogue_box: CanvasLayer = $DialogueBox

var scroll_speed := 12.0
var elapsed := 0.0
var ride_started := false
var dialogue_played := false

# Per-job visual configs: [fog_density, scroll_speed, light_flicker_chance]
var job_configs := [
	{"fog_density": 0.04, "scroll_speed": 12.0, "flicker": 0.02},
	{"fog_density": 0.06, "scroll_speed": 14.0, "flicker": 0.05},
	{"fog_density": 0.08, "scroll_speed": 16.0, "flicker": 0.1},
]


func _ready() -> void:
	dialogue_box.add_to_group("dialogue_box")
	var config: Dictionary = job_configs[mini(GameManager.current_job, job_configs.size() - 1)]
	scroll_speed = config["scroll_speed"]
	$WorldEnvironment.environment.fog_density = config["fog_density"]

	# Fade in from black
	TransitionOverlay.hold_black()
	await get_tree().create_timer(0.5).timeout
	TransitionOverlay.fade_in(1.5)
	await TransitionOverlay.fade_in_finished
	ride_started = true

	# Start dialogue after a moment
	await get_tree().create_timer(2.0).timeout
	_start_dialogue()


func _process(delta: float) -> void:
	if not ride_started:
		return

	elapsed += delta

	# Scroll environment
	scrolling_env.position.z += scroll_speed * delta

	# Flicker streetlights
	var config: Dictionary = job_configs[mini(GameManager.current_job, job_configs.size() - 1)]
	for light: Node in get_tree().get_nodes_in_group("streetlight"):
		if light is OmniLight3D and randf() < config["flicker"]:
			light.light_energy = randf_range(0.1, 0.8)

	# Reset scrolling chunks to loop
	if scrolling_env.position.z > 40.0:
		scrolling_env.position.z -= 40.0


func _start_dialogue() -> void:
	var key := "car_ride_%d" % GameManager.current_job
	GameManager.start_dialogue(key)

	dialogue_box.dialogue_finished.connect(_on_dialogue_finished, CONNECT_ONE_SHOT)


func _on_dialogue_finished() -> void:
	dialogue_played = true
	# Brief pause then transition to job site
	await get_tree().create_timer(2.0).timeout
	_transition_to_job()


func _transition_to_job() -> void:
	GameManager.set_state(GameManager.GameState.JOB_ARRIVING)
	TransitionOverlay.fade_out(2.0)
	await TransitionOverlay.fade_out_finished
	var path: String = GameManager.job_scene_paths[GameManager.current_job]
	GameManager.transition_to_scene(path)
