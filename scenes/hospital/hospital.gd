extends Node3D

@onready var dialogue_box: CanvasLayer = $DialogueBox
@onready var player: CharacterBody3D = $Player
@onready var ps1_overlay: ColorRect = $PS1Overlay
@onready var flicker_light: OmniLight3D = $FlickerLight


func _ready() -> void:
	GameManager.player = player
	dialogue_box.add_to_group("dialogue_box")
	GameManager.set_state(GameManager.GameState.HOSPITAL_EXPLORING)
	AudioManager.play_ambient("light_buzz", 1.5, -12.0)


func _process(delta: float) -> void:
	# Flickering fluorescent light effect
	if flicker_light:
		if randf() < 0.02:
			flicker_light.light_energy = randf_range(0.1, 0.4)
		else:
			flicker_light.light_energy = lerpf(flicker_light.light_energy, 0.8, delta * 4.0)
