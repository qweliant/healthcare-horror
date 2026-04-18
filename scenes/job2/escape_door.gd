extends Interactable

## A door in the basement that becomes interactable after the ritual.
## Transitions to the stairwell escape scene.

var escape_enabled := false


func get_interact_prompt() -> String:
	if not escape_enabled:
		return ""
	if one_shot and has_interacted:
		return ""
	return prompt_text


func interact() -> void:
	if not escape_enabled:
		return
	if one_shot and has_interacted:
		return
	has_interacted = true
	_on_interact()


func _on_interact() -> void:
	GameManager.set_state(GameManager.GameState.JOB_ESCAPE_ATTEMPT)
	TransitionOverlay.fade_out(1.0)
	await TransitionOverlay.fade_out_finished
	GameManager.transition_to_scene("res://scenes/stairwell/stairwell.tscn")
