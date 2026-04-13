extends Node


func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	TransitionOverlay.fade_in(2.5)
	await TransitionOverlay.fade_in_finished
	await get_tree().create_timer(6.0).timeout
	$EndCard/AnyKeyLabel.visible = true


func _unhandled_input(_event: InputEvent) -> void:
	if $EndCard/AnyKeyLabel.visible:
		get_tree().quit()
