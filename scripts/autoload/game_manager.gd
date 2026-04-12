extends Node

signal state_changed(new_state: GameState)
signal dialogue_requested(dialogue_key: String)
signal job_completed(job_index: int)

enum GameState {
	HOSPITAL_WAKING,
	HOSPITAL_EXPLORING,
	HOSPITAL_CHECKOUT,
	BILL_REVEAL,
	HOSPITAL_LEAVING,
	PHONE_CALL,
	CAR_RIDE,
	JOB_ARRIVING,
	JOB_MEETING,
	JOB_EXPLORING,
	JOB_RITUAL,
	JOB_AFTERMATH,
	JOB_PHONE_CALL,
}

var current_state: GameState = GameState.HOSPITAL_WAKING
var player: CharacterBody3D = null
var bill_amount: int = 247_893
var current_job: int = 0
var job_payouts: Array[int] = [82_631, 82_631, 82_631]
var job_scene_paths: Array[String] = [
	"res://scenes/job1_warehouse/warehouse.tscn",
	"res://scenes/job2/job2.tscn",
	"res://scenes/job3/job3.tscn",
]


func set_state(new_state: GameState) -> void:
	current_state = new_state
	state_changed.emit(new_state)


func complete_job() -> void:
	bill_amount -= job_payouts[current_job]
	job_completed.emit(current_job)


func advance_job() -> void:
	current_job += 1


func format_bill() -> String:
	return "$%s" % _format_number(bill_amount)


func format_payment() -> String:
	return "$%s" % _format_number(job_payouts[current_job])


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


func has_more_jobs() -> bool:
	return current_job < job_scene_paths.size() - 1
