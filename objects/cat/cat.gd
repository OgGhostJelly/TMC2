extends RigidBody2D


func _physics_process(_delta: float) -> void:
	var global_mouse_position = get_global_mouse_position()
	var direction: Vector2 = global_position.direction_to(global_mouse_position)
	var distance: float = global_position.distance_to(global_mouse_position)
	
	if Input.is_action_pressed("move"):
		apply_force(direction * distance)
