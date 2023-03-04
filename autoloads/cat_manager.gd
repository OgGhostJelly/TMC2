extends Node


var cats: Array[Node]


func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("multiply"): return
	spawn_cat()


func spawn_cat() -> void:
	var cat: PackedScene = preload("res://objects/cat/cat.tscn")
	var current_scene = get_tree().current_scene
	var obj: Node2D = cat.instantiate()
	obj.global_position = current_scene.get_global_mouse_position()
	cats.append(obj)
	obj.tree_exited.connect(func(): cats.erase(obj))
	current_scene.call_deferred('add_child', obj)
