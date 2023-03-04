extends CharacterBody2D


func _physics_process(_delta: float) -> void:
	var global_mouse_position: Vector2 = get_global_mouse_position()
	var direction: Vector2 = global_position.direction_to(global_mouse_position)
	
	global_position = global_position.move_toward(global_mouse_position, 100 * _delta)
