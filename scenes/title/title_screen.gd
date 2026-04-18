extends Node

func _on_start_game_button_pressed() -> void:
	$MarginContainer/TitleContainer.visible = false
	$MarginContainer/WarningContainer.visible = true
	
func _input(_event):
	if $MarginContainer/WarningContainer.visible and _event is InputEventMouseButton and _event.pressed:
		get_tree().change_scene_to_file("res://scenes/hospital/hospital.tscn")

func _unhandled_input(_event: InputEvent) -> void:
	if $MarginContainer/WarningContainer.visible and _event is InputEventKey and _event.pressed:
		get_tree().change_scene_to_file("res://scenes/hospital/hospital.tscn")
