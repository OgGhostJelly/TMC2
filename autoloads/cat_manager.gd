extends Node


const GRAB_AMOUNT: int = 2
var selected_cats: Array = []


func _physics_process(_delta: float) -> void:
	for cat in selected_cats: cat.move()
	
	print(selected_cats)


func _input(event: InputEvent) -> void:
	if not event.is_action("move"): return
	selected_cats = [] if not event.is_pressed() else get_cats().slice(0,GRAB_AMOUNT)


func get_cats() -> Array:
	var global_mouse_position: Vector2 = get_tree().current_scene.get_global_mouse_position()

	var cats: Array = get_tree().get_nodes_in_group('cats')
	cats.sort_custom(func(a,b):
		return global_mouse_position.distance_squared_to(a.global_position) < global_mouse_position.distance_squared_to(b.global_position)
		)
	
	return cats


func spawn_cat(position: Vector2) -> void:
	var cat: PackedScene = preload("res://objects/cat/cat.tscn")
	var obj: Node2D = cat.instantiate()
	obj.global_position = position
	get_tree().current_scene.call_deferred('add_child', obj)
