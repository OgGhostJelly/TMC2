extends Node


func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("multiply"): return
	spawn_cat(get_tree().current_scene.get_global_mouse_position())


func spawn_cat(position: Vector2) -> void:
	var cat: PackedScene = preload("res://objects/cat/cat.tscn")
	var obj: Node2D = cat.instantiate()
	obj.global_position = position
	get_tree().current_scene.call_deferred('add_child', obj)
