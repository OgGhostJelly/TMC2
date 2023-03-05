extends Camera2D


@export var speed: float = 20.0


func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
	
	# get all cats positions
	var cats_position: Array = get_tree().get_nodes_in_group('cats').map(func(x): return x.global_position)
	# get the center of all positions
	var center: Vector2 = cats_position.reduce(func(rect, pos): return rect.expand(pos), Rect2(global_position.x, global_position.y, 0, 0)).get_center()
	
	if global_position.x < center.x:
		global_position.x = center.x
