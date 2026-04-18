extends Interactable

## The hospital exit door.
## Before checkout: doors won't open, triggers anxiety dialogue.
## After bill reveal: normal exit flow.

var _tried_early := false


func _ready() -> void:
	prompt_text = "[E] Leave"
	dialogue_key = ""


func get_interact_prompt() -> String:
	if GameManager.current_state == GameManager.GameState.HOSPITAL_EXPLORING:
		if _tried_early:
			return ""
		return "[E] Leave"
	if GameManager.current_state >= GameManager.GameState.HOSPITAL_LEAVING:
		return "[E] Leave"
	return ""


func interact() -> void:
	if GameManager.current_state == GameManager.GameState.HOSPITAL_EXPLORING:
		if _tried_early:
			return
		_tried_early = true
		GameManager.start_dialogue("exit_early")
		return

	if GameManager.current_state < GameManager.GameState.HOSPITAL_LEAVING:
		return

	GameManager.start_dialogue("exit_door")

	var dialogue_box := get_tree().get_first_node_in_group("dialogue_box")
	if dialogue_box:
		dialogue_box.dialogue_finished.connect(_on_exit_dialogue_finished, CONNECT_ONE_SHOT)


func _on_exit_dialogue_finished() -> void:
	GameManager.set_state(GameManager.GameState.PHONE_CALL)
	await get_tree().create_timer(1.5).timeout
	GameManager.start_dialogue("phone_call")

	var dialogue_box := get_tree().get_first_node_in_group("dialogue_box")
	if dialogue_box:
		dialogue_box.dialogue_finished.connect(_on_phone_finished, CONNECT_ONE_SHOT)


func _on_phone_finished() -> void:
	GameManager.set_state(GameManager.GameState.CAR_RIDE)
	TransitionOverlay.fade_out(1.5)
	await TransitionOverlay.fade_out_finished
	GameManager.transition_to_scene("res://scenes/car_ride/car_ride.tscn")
