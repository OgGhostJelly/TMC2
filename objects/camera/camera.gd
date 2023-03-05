extends Camera2D


@export var speed: float = 20.0


func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
	
	# get all cats positions
	var cats_position: Array = get_tree().get_nodes_in_group('cats').map(func(x): return x.global_position)
	# get the average of all the positions
	var averaged_vector: Vector2 = cats_position.reduce(func(accum, vec): return ( vec + accum ) / 2, cats_position.pop_front())
	
	if averaged_vector.x > global_position.x:
		global_position.x = averaged_vector.x
