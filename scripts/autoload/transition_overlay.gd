extends CanvasLayer

signal fade_out_finished
signal fade_in_finished
signal flash_finished

@onready var color_rect: ColorRect = $ColorRect

var _tween: Tween = null


func _ready() -> void:
	layer = 100
	var rect := ColorRect.new()
	rect.name = "ColorRect"
	rect.color = Color(0, 0, 0, 0)
	rect.anchors_preset = 15  # PRESET_FULL_RECT
	rect.anchor_right = 1.0
	rect.anchor_bottom = 1.0
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(rect)
	color_rect = rect


func fade_out(duration: float = 1.0) -> void:
	_kill_tween()
	_tween = create_tween()
	_tween.tween_property(color_rect, "color", Color(0, 0, 0, 1), duration)
	_tween.tween_callback(fade_out_finished.emit)


func fade_in(duration: float = 1.0) -> void:
	_kill_tween()
	_tween = create_tween()
	_tween.tween_property(color_rect, "color", Color(0, 0, 0, 0), duration)
	_tween.tween_callback(fade_in_finished.emit)


func flash_color(color: Color = Color(0.5, 0, 0, 1), duration: float = 0.5) -> void:
	_kill_tween()
	color_rect.color = color
	_tween = create_tween()
	_tween.tween_property(color_rect, "color", Color(0, 0, 0, 0), duration)
	_tween.tween_callback(flash_finished.emit)


func hold_black() -> void:
	_kill_tween()
	color_rect.color = Color(0, 0, 0, 1)


func _kill_tween() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()
