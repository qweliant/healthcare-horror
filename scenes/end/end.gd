extends Node

const _SEQUENCE = [
	{"bg": Color(1, 1, 1, 1),        "text": "CONGRATULATIONS",        "fg": Color(0, 0, 0, 1),   "hold": 2.0},
	{"bg": Color(0, 0, 0, 1),        "text": "",                        "fg": Color(0, 0, 0, 1),   "hold": 0.8},
	{"bg": Color(0.7, 0.0, 0.0, 1),  "text": "YOU DID IT.",           "fg": Color(1, 1, 1, 1),   "hold": 1.8},
	{"bg": Color(0, 0, 0, 1),        "text": "",                        "fg": Color(0, 0, 0, 1),   "hold": 0.6},
	{"bg": Color(0.45, 0.0, 0.5, 1), "text": "WAS IT WORTH IT?",        "fg": Color(1, 1, 1, 1),   "hold": 2.5},
	{"bg": Color(0, 0, 0, 1),        "text": "",                        "fg": Color(0, 0, 0, 1),   "hold": 1.2},
	{"bg": Color(0.0, 0.4, 0.0, 1),  "text": "YOUR ACCOUNT PAID IN FULL.",   "fg": Color(1, 1, 1, 1),   "hold": 2.5},
	{"bg": Color(0, 0, 0, 1),        "text": "",                        "fg": Color(0, 0, 0, 1),   "hold": 1.0},
	{"bg": Color(1, 1, 1, 1),        "text": "it was worth it...",        "fg": Color(0, 0, 0, 1),   "hold": 2.5},
	{"bg": Color(0, 0, 0, 1),        "text": "",                        "fg": Color(0, 0, 0, 1),   "hold": 1.5},
	{"bg": Color(0.7, 0.0, 0.0, 1),  "text": "YOU FEEL VERY CLEAN.",    "fg": Color(1, 1, 1, 1),   "hold": 2.0},
	{"bg": Color(0, 0, 0, 1),        "text": "",                        "fg": Color(0, 0, 0, 1),   "hold": 0.6},
	{"bg": Color(1, 1, 1, 1),        "text": "CONGRATULATIONS.",        "fg": Color(0, 0, 0, 1),   "hold": 3.0},
]


func _ready() -> void:
	$EndCard/FlashBG.color = Color(0, 0, 0, 1)
	$EndCard/SequenceLabel.visible = false
	$EndCard/TitleLabel.visible = false
	$EndCard/AnyKeyLabel.visible = false
	AudioManager.stop_all()
	AudioManager.play_music("party_time", -4.0)
	TransitionOverlay.fade_in(0.3)
	await TransitionOverlay.fade_in_finished
	await _run_flash_sequence()
	await _show_final_card()


func _run_flash_sequence() -> void:
	var flash_bg: ColorRect = $EndCard/FlashBG
	var seq_label: Label = $EndCard/SequenceLabel
	for entry in _SEQUENCE:
		flash_bg.color = entry["bg"]
		if entry["text"] != "":
			seq_label.add_theme_color_override("font_color", entry["fg"])
			seq_label.text = entry["text"]
			seq_label.visible = true
		else:
			seq_label.visible = false
		await get_tree().create_timer(entry["hold"]).timeout
	seq_label.visible = false
	flash_bg.color = Color(0, 0, 0, 1)


func _show_final_card() -> void:
	await get_tree().create_timer(1.5).timeout
	$EndCard/TitleLabel.modulate = Color(1, 1, 1, 0)
	$EndCard/TitleLabel.visible = true
	var tween := create_tween()
	tween.tween_property($EndCard/TitleLabel, "modulate:a", 1.0, 2.0)
	await tween.finished
	await get_tree().create_timer(3.0).timeout
	$EndCard/AnyKeyLabel.visible = true


func _unhandled_input(_event: InputEvent) -> void:
	if $EndCard/AnyKeyLabel.visible:
		get_tree().quit()
