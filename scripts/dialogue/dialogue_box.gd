extends CanvasLayer

signal dialogue_finished

@onready var panel: PanelContainer = $Panel
@onready var speaker_label: Label = $Panel/VBox/SpeakerLabel
@onready var text_label: RichTextLabel = $Panel/VBox/TextLabel

var dialogue_lines: Array = []
var current_line := 0
var is_typing := false
var is_active := false

var type_speed := 0.03
var _type_timer := 0.0
var _visible_chars := 0


func _ready() -> void:
	panel.visible = false
	GameManager.dialogue_requested.connect(_on_dialogue_requested)


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


func _unhandled_input(event: InputEvent) -> void:
	if not is_active:
		return

	if event.is_action_pressed("advance_dialogue"):
		if is_typing:
			# Show all text immediately
			is_typing = false
			text_label.visible_characters = -1
		else:
			_advance()
		get_viewport().set_input_as_handled()


func _on_dialogue_requested(key: String) -> void:
	if not DialogueData.dialogues.has(key):
		push_warning("Dialogue key not found: " + key)
		return

	dialogue_lines = DialogueData.dialogues[key].duplicate()
	# Replace bill placeholder
	for i in dialogue_lines.size():
		dialogue_lines[i] = dialogue_lines[i].duplicate()
		dialogue_lines[i]["text"] = dialogue_lines[i]["text"].replace("%BILL%", GameManager.format_bill())

	current_line = 0
	is_active = true
	panel.visible = true
	_show_line()


func _show_line() -> void:
	var line: Dictionary = dialogue_lines[current_line]
	speaker_label.text = line["speaker"]
	speaker_label.visible = line["speaker"] != ""
	text_label.text = line["text"]
	text_label.visible_characters = 0
	_visible_chars = 0
	_type_timer = 0.0
	is_typing = true


func _advance() -> void:
	current_line += 1
	if current_line >= dialogue_lines.size():
		_close()
	else:
		_show_line()


func _close() -> void:
	is_active = false
	panel.visible = false
	dialogue_finished.emit()
	GameManager.end_dialogue()
