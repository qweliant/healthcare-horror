extends Node

signal state_changed(new_state: GameState)
signal dialogue_requested(dialogue_key: String)

enum GameState {
	HOSPITAL_WAKING,
	HOSPITAL_EXPLORING,
	HOSPITAL_CHECKOUT,
	BILL_REVEAL,
	HOSPITAL_LEAVING,
	PHONE_CALL,
	JOB_SITE,
}

var current_state: GameState = GameState.HOSPITAL_WAKING
var player: CharacterBody3D = null
var bill_amount: int = 247_893


func advance_state() -> void:
	match current_state:
		GameState.HOSPITAL_WAKING:
			set_state(GameState.HOSPITAL_EXPLORING)
		GameState.HOSPITAL_EXPLORING:
			set_state(GameState.HOSPITAL_CHECKOUT)
		GameState.HOSPITAL_CHECKOUT:
			set_state(GameState.BILL_REVEAL)
		GameState.BILL_REVEAL:
			set_state(GameState.HOSPITAL_LEAVING)
		GameState.HOSPITAL_LEAVING:
			set_state(GameState.PHONE_CALL)
		GameState.PHONE_CALL:
			set_state(GameState.JOB_SITE)


func set_state(new_state: GameState) -> void:
	current_state = new_state
	state_changed.emit(new_state)


func format_bill() -> String:
	return "$%s" % _format_number(bill_amount)


func _format_number(n: int) -> String:
	var s := str(n)
	var result := ""
	var count := 0
	for i in range(s.length() - 1, -1, -1):
		if count > 0 and count % 3 == 0:
			result = "," + result
		result = s[i] + result
		count += 1
	return result


func start_dialogue(key: String) -> void:
	dialogue_requested.emit(key)
	if player:
		player.freeze()


func end_dialogue() -> void:
	if player:
		player.unfreeze()


func transition_to_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
