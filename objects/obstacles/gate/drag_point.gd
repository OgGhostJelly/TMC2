extends Marker2D
@export var handle: RigidBody2D
func _drag() -> void:
	var global_mouse_position = get_global_mouse_position()
	var direction: Vector2 = global_position.direction_to(global_mouse_position)
	var distance: float = global_position.distance_to(global_mouse_position)
	
	handle.apply_force(direction * distance)
