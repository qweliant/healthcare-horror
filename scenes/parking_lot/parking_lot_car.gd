extends Interactable

## The player's car in the parking lot. Dead battery, no gas.


func _ready() -> void:
	prompt_text = "[E] Get in your car"
	one_shot = true


func _on_interact() -> void:
	var lot := _get_parking_lot()
	if lot:
		lot.on_car_interacted()


func _get_parking_lot() -> Node:
	var node := get_parent()
	while node:
		if node.has_method("on_car_interacted"):
			return node
		node = node.get_parent()
	return null
