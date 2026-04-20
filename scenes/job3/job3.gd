extends JobSiteBase


func _on_bill_call_finished() -> void:
	await get_tree().create_timer(3.0).timeout
	TransitionOverlay.fade_out(2.0)
	await TransitionOverlay.fade_out_finished
	GameManager.transition_to_scene("res://scenes/end/end.tscn")
