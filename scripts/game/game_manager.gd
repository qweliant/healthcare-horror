extends Node

signal state_changed(new_state: GameState)
signal dialogue_requested(dialogue_key: String)
signal job_completed(payout: int)

enum GameState {
	HOSPITAL_WAKING,
	HOSPITAL_EXPLORING,
	HOSPITAL_CHECKOUT,
	BILL_REVEAL,
	HOSPITAL_LEAVING,
	PARKING_LOT,
	PHONE_CALL,
	CAR_RIDE,
	JOB_ARRIVING,
	JOB_MEETING,
	JOB_EXPLORING,
	JOB_RITUAL,
	JOB_AFTERMATH,
	JOB_ESCAPE_ATTEMPT,
	JOB_PHONE_CALL,
}

var current_state: GameState = GameState.HOSPITAL_WAKING
var player: CharacterBody3D = null
var bill_amount: int = 247_893

## Transient state used between an outgoing job and the car ride.
## The outgoing job (or the parking lot for the first ride) sets these
## before transitioning to car_ride.tscn so the car ride knows which job
## comes next. There is no longer a global current_job counter — each job
## scene declares its own job_index, payout, and successor.
var pending_job_scene: PackedScene = null
var pending_job_index: int = 0


func set_state(new_state: GameState) -> void:
	current_state = new_state
	state_changed.emit(new_state)


func complete_job(payout: int) -> void:
	bill_amount -= payout
	job_completed.emit(payout)


func format_bill() -> String:
	return "$%s" % _format_number(bill_amount)


func format_payment(amount: int) -> String:
	return "$%s" % _format_number(amount)


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


func transition_to_packed_scene(scene: PackedScene) -> void:
	get_tree().change_scene_to_packed(scene)
