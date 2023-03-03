extends RigidBody2D


func _physics_process(_delta: float) -> void:
	var global_mouse_position: Vector2 = get_global_mouse_position()
	var direction: Vector2 = global_position.direction_to(global_mouse_position)
	
	apply_force(global_position.distance_to(global_mouse_position) * direction)
