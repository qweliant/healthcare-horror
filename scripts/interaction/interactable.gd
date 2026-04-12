class_name Interactable
extends StaticBody3D

@export var prompt_text := "[E] Interact"
@export var dialogue_key := ""
@export var one_shot := false

var has_interacted := false


func interact() -> void:
	if one_shot and has_interacted:
		return
	has_interacted = true
	_on_interact()


func _on_interact() -> void:
	if dialogue_key != "":
		GameManager.start_dialogue(dialogue_key)


func get_interact_prompt() -> String:
	if one_shot and has_interacted:
		return ""
	return prompt_text
