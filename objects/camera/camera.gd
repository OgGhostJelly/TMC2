extends Camera2D


@export var speed: float = 20.0


func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
	
	var cats: Array[Node] = get_tree().get_nodes_in_group('cats')
	var averaged_vector: Vector2 = cats.pop_front().global_position
	
	for cat in cats:
		averaged_vector = ( cat.global_position + averaged_vector ) / 2
	
	if averaged_vector.x > global_position.x:
		global_position.x = averaged_vector.x
