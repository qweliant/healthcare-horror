extends Interactable

## The checkout nurse triggers the bill reveal sequence.

var checkout_started := false


func _ready() -> void:
	prompt_text = "[E] Talk to Nurse"
	dialogue_key = "nurse_checkout"
	one_shot = true


func _on_interact() -> void:
	if checkout_started:
		return
	checkout_started = true
	GameManager.set_state(GameManager.GameState.HOSPITAL_CHECKOUT)
	GameManager.start_dialogue("nurse_checkout")

	# When checkout dialogue ends, show the bill
	var dialogue_box := get_tree().get_first_node_in_group("dialogue_box")
	if dialogue_box:
		dialogue_box.dialogue_finished.connect(_on_checkout_finished, CONNECT_ONE_SHOT)


func _on_checkout_finished() -> void:
	# Small delay, then bill reveal
	await get_tree().create_timer(1.0).timeout
	GameManager.set_state(GameManager.GameState.BILL_REVEAL)
	AudioManager.play_sfx("panic_attack", -3.0)
	GameManager.start_dialogue("bill_reveal")

	var dialogue_box := get_tree().get_first_node_in_group("dialogue_box")
	if dialogue_box:
		dialogue_box.dialogue_finished.connect(_on_bill_finished, CONNECT_ONE_SHOT)


func _on_bill_finished() -> void:
	GameManager.set_state(GameManager.GameState.HOSPITAL_LEAVING)
