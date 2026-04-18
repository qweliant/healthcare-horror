extends CharacterBody3D

@export var move_speed := 3.0
@export var mouse_sensitivity := 0.002

@onready var camera: Camera3D = $Camera3D
@onready var interact_ray: RayCast3D = $Camera3D/InteractRay
@onready var interact_label: Label = $UI/InteractLabel

var can_move := true
var current_interactable: Node = null


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and can_move:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, -PI / 3.0, PI / 3.0)

	if event.is_action_pressed("interact") and current_interactable:
		current_interactable.interact()

	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 9.8 * delta

	if can_move:
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		velocity.x = direction.x * move_speed
		velocity.z = direction.z * move_speed
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	move_and_slide()
	_check_interaction()


func _check_interaction() -> void:
	if interact_ray.is_colliding():
		var collider := interact_ray.get_collider()
		if collider.has_method("interact"):
			var prompt: String = collider.get_interact_prompt() if collider.has_method("get_interact_prompt") else "[E] Interact"
			if prompt != "":
				current_interactable = collider
				interact_label.text = prompt
				interact_label.visible = true
				return

	current_interactable = null
	interact_label.visible = false


func freeze() -> void:
	can_move = false


func unfreeze() -> void:
	can_move = true
