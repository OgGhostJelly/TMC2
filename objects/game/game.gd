extends Node2D


@export var cat: PackedScene


func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("multiply"): return
	
	var obj: Node2D = cat.instantiate()
	obj.global_position = get_global_mouse_position()
	call_deferred('add_child', obj)
