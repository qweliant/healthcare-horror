class_name JobNPC
extends Interactable

## NPC at a job site. Supports escalating dialogue via talk_count.
## Dialogue keys follow the pattern: "job{job_index}_{npc_id}_{talk_count}"

@export var npc_id: String = "npc"
@export var max_talks: int = 3

var talk_count: int = 0


func _ready() -> void:
	one_shot = false


func _on_interact() -> void:
	var job := get_tree().get_first_node_in_group("job_site") as JobSiteBase
	var job_index := job.job_index if job else 0
	var key := "job%d_%s_%d" % [job_index, npc_id, talk_count]
	if DialogueData.dialogues.has(key):
		GameManager.start_dialogue(key)
		if talk_count < max_talks - 1:
			talk_count += 1
	else:
		# Fall back to last available dialogue
		var fallback := "job%d_%s_%d" % [job_index, npc_id, talk_count - 1]
		if talk_count > 0 and DialogueData.dialogues.has(fallback):
			GameManager.start_dialogue(fallback)


func get_interact_prompt() -> String:
	if GameManager.current_state < GameManager.GameState.JOB_EXPLORING:
		return ""
	return prompt_text
