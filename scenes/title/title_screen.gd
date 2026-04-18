extends Node

func _on_start_game_button_pressed() -> void:
	$TitleCard/TitleLabel.visible = false
	$TitleCard/StartGameButton.visible = false
	$TitleCard/WarningTitleLabel.visible = true
	$TitleCard/WarningLabel.visible = true
	$TitleCard/AnyKeyLabel.visible = true

func _input(event):
	if $TitleCard/AnyKeyLabel.visible and event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://scenes/hospital/hospital.tscn")

func _unhandled_input(_event: InputEvent) -> void:
	if $TitleCard/AnyKeyLabel.visible:
		get_tree().change_scene_to_file("res://scenes/hospital/hospital.tscn")
