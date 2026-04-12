class_name RitualInteractable
extends Interactable

## The sigil trigger point. Only interactable after meeting phase is complete.


func _ready() -> void:
	prompt_text = "[E] Approach the sigil"
	one_shot = true


func get_interact_prompt() -> String:
	var site := _get_job_site()
	if not site or not site.meeting_complete:
		return ""
	if site.ritual_triggered:
		return ""
	return prompt_text


func interact() -> void:
	var site := _get_job_site()
	if not site or not site.meeting_complete or site.ritual_triggered:
		return
	site.start_ritual()


func _get_job_site() -> JobSiteBase:
	# Walk up the tree to find the JobSiteBase
	var node := get_parent()
	while node:
		if node is JobSiteBase:
			return node
		node = node.get_parent()
	return null
