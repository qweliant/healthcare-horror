extends Interactable

## The hospital exit door. Only usable after the bill reveal.


func _ready() -> void:
	prompt_text = "[E] Leave"
	dialogue_key = "exit_door"
	one_shot = true


func get_interact_prompt() -> String:
	if GameManager.current_state < GameManager.GameState.HOSPITAL_LEAVING:
		return ""
	return prompt_text


func interact() -> void:
	if GameManager.current_state < GameManager.GameState.HOSPITAL_LEAVING:
		return
	GameManager.start_dialogue("exit_door")

	var dialogue_box := get_tree().get_first_node_in_group("dialogue_box")
	if dialogue_box:
		dialogue_box.dialogue_finished.connect(_on_exit_dialogue_finished, CONNECT_ONE_SHOT)


func _on_exit_dialogue_finished() -> void:
	# Transition to phone call / outside
	GameManager.set_state(GameManager.GameState.PHONE_CALL)
	await get_tree().create_timer(1.5).timeout
	GameManager.start_dialogue("phone_call")

	var dialogue_box := get_tree().get_first_node_in_group("dialogue_box")
	if dialogue_box:
		dialogue_box.dialogue_finished.connect(_on_phone_finished, CONNECT_ONE_SHOT)


func _on_phone_finished() -> void:
	GameManager.set_state(GameManager.GameState.JOB_SITE)
	# TODO: Transition to job site scene
	# GameManager.transition_to_scene("res://scenes/job_site/job_site.tscn")
	print("DEMO END - Job site scene not yet implemented")
