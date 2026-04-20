extends CanvasLayer

signal dialogue_finished

@onready var panel: PanelContainer = $Panel
@onready var speaker_label: Label = $Panel/VBox/SpeakerLabel
@onready var text_label: RichTextLabel = $Panel/VBox/TextLabel
@onready var dialogue_audio: AudioStreamPlayer = $DialogueAudio

var dialogue_lines: Array = []
var current_line := 0
var is_typing := false
var is_active := false
var _showing_choices := false

var type_speed := 0.03
var _type_timer := 0.0
var _visible_chars := 0

var choice_container: VBoxContainer


func _ready() -> void:
	panel.visible = false
	GameManager.dialogue_requested.connect(_on_dialogue_requested)

	choice_container = VBoxContainer.new()
	choice_container.name = "ChoiceContainer"
	choice_container.visible = false
	$Panel/VBox.add_child(choice_container)


func _process(delta: float) -> void:
	if not is_active:
		return

	if is_typing:
		_type_timer += delta
		if _type_timer >= type_speed:
			_type_timer = 0.0
			_visible_chars += 1
			text_label.visible_characters = _visible_chars
			if _visible_chars >= text_label.get_total_character_count():
				is_typing = false
				_stop_typing_audio()


func _unhandled_input(event: InputEvent) -> void:
	if not is_active or _showing_choices:
		return

	if event.is_action_pressed("advance_dialogue"):
		if is_typing:
			is_typing = false
			text_label.visible_characters = -1
			_stop_typing_audio()
		else:
			_advance()
		get_viewport().set_input_as_handled()


func _on_dialogue_requested(key: String) -> void:
	if not DialogueData.dialogues.has(key):
		push_warning("Dialogue key not found: " + key)
		return

	dialogue_lines = DialogueData.dialogues[key].duplicate(true)
	_replace_placeholders(dialogue_lines)

	current_line = 0
	is_active = true
	panel.visible = true
	_show_line()


func _replace_placeholders(lines: Array) -> void:
	var job := get_tree().get_first_node_in_group("job_site") as JobSiteBase
	var payout = job.payout if job else 0
	var payment_text := GameManager.format_payment(payout)
	for i in lines.size():
		if lines[i].has("text"):
			lines[i]["text"] = lines[i]["text"].replace("%BILL%", GameManager.format_bill())
			lines[i]["text"] = lines[i]["text"].replace("%PAYMENT%", payment_text)
		if lines[i].has("choices"):
			for choice in lines[i]["choices"]:
				if choice.has("response"):
					_replace_placeholders(choice["response"])


func _show_line() -> void:
	var line: Dictionary = dialogue_lines[current_line]

	if line.has("choices"):
		_show_choices(line["choices"])
		return

	choice_container.visible = false
	_showing_choices = false
	text_label.visible = true

	var speaker: String = str(line.get("speaker", ""))
	speaker_label.text = speaker
	speaker_label.visible = speaker != ""
	text_label.text = line["text"]
	text_label.visible_characters = 0
	_visible_chars = 0
	_type_timer = 0.0
	is_typing = true
	if speaker != "" and speaker != "You" and text_label.get_total_character_count() > 0:
		dialogue_audio.play()


func _show_choices(choices: Array) -> void:
	_showing_choices = true
	speaker_label.visible = false
	text_label.visible = false
	choice_container.visible = true

	for child in choice_container.get_children():
		child.queue_free()

	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	for i in choices.size():
		var btn := Button.new()
		btn.text = "> " + choices[i]["text"]
		btn.alignment = HORIZONTAL_ALIGNMENT_LEFT
		btn.add_theme_color_override("font_color", Color(0.7, 0.7, 0.7))
		btn.add_theme_color_override("font_hover_color", Color(1.0, 0.3, 0.3))
		btn.add_theme_color_override("font_pressed_color", Color(1.0, 0.2, 0.2))
		var normal_style := StyleBoxFlat.new()
		normal_style.bg_color = Color(0.1, 0.1, 0.12, 0.8)
		normal_style.border_color = Color(0.3, 0.1, 0.1, 0.5)
		normal_style.set_border_width_all(1)
		normal_style.set_content_margin_all(8)
		btn.add_theme_stylebox_override("normal", normal_style)
		var hover_style := normal_style.duplicate()
		hover_style.bg_color = Color(0.15, 0.08, 0.08, 0.9)
		hover_style.border_color = Color(0.6, 0.1, 0.1, 0.8)
		btn.add_theme_stylebox_override("hover", hover_style)
		var pressed_style := normal_style.duplicate()
		pressed_style.bg_color = Color(0.2, 0.05, 0.05, 0.95)
		btn.add_theme_stylebox_override("pressed", pressed_style)
		btn.pressed.connect(_on_choice_selected.bind(i, choices))
		choice_container.add_child(btn)


func _on_choice_selected(index: int, choices: Array) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	_showing_choices = false
	choice_container.visible = false
	text_label.visible = true

	var response: Array = choices[index]["response"]
	var insert_pos := current_line + 1
	for i in response.size():
		dialogue_lines.insert(insert_pos + i, response[i])

	_advance()


func _advance() -> void:
	current_line += 1
	if current_line >= dialogue_lines.size():
		_close()
	else:
		_show_line()


func _close() -> void:
	_stop_typing_audio()
	is_active = false
	_showing_choices = false
	panel.visible = false
	choice_container.visible = false
	dialogue_finished.emit()
	GameManager.end_dialogue()


func _stop_typing_audio() -> void:
	dialogue_audio.stop()
