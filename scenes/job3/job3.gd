extends JobSiteBase


func _setup_environment() -> void:
	AudioManager.play_sfx("startling_scrape")
	AudioManager.play_ambient("wind", 2.0, -8.0)
	AudioManager.play_layer("heartbeats", 3.0, -14.0)


func _on_bill_call_finished() -> void:
	await get_tree().create_timer(3.0).timeout
	AudioManager.stop_ambient(2.0)
	AudioManager.stop_layer(2.0)
	TransitionOverlay.fade_out(2.0)
	await TransitionOverlay.fade_out_finished
	GameManager.transition_to_scene("res://scenes/end/end.tscn")
