extends Node


func spawn_cat(position: Vector2) -> void:
	var cat: PackedScene = preload("res://objects/cat/cat.tscn")
	var obj: Node2D = cat.instantiate()
	obj.global_position = position
	get_tree().current_scene.call_deferred('add_child', obj)
