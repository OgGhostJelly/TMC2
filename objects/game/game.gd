extends Node2D


@export var cat: PackedScene
var cat_count: int = 1


func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("multiply"): return
	
	for i in cat_count:
		var obj: Node2D = cat.instantiate()
		global_position = get_global_mouse_position()
		add_child(obj)
	
	cat_count = pow(2, cat_count)
