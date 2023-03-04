extends Node


const GRAB_AMOUNT: int = 3
const MAX_DISTANCE: float = 100.0
var selected_cats: Array = []: set = _on_selected_cats_changed


func _physics_process(_delta: float) -> void:
	for cat in selected_cats: if is_instance_valid(cat): cat.move()


func _input(event: InputEvent) -> void:
	if not event.is_action("move"): return
	selected_cats = [] if not event.is_pressed() else get_cats().slice(0,GRAB_AMOUNT)


func get_cats() -> Array:
	
	var cats: Array = get_tree().get_nodes_in_group('cats')
	
	# sort cats by distance from mouse with 0 being closest
	cats.sort_custom(func(a: Cat,b: Cat):
		a.update_distance_to_mouse_squared()
		b.update_distance_to_mouse_squared()
		return a.distance_to_mouse_squared < b.distance_to_mouse_squared
		)
	
	# remove all cats that are further than max_distance_squared from the mouse
	var max_distance_squared: float = pow(MAX_DISTANCE, 2)
	for i in cats.size():
		if cats[i].distance_to_mouse_squared > max_distance_squared:
			cats = cats.slice(0, i)
			break
	
	return cats


func spawn_cat(position: Vector2) -> void:
	var cat: PackedScene = preload("res://objects/cat/cat.tscn")
	var obj: Node2D = cat.instantiate()
	obj.global_position = position
	get_tree().current_scene.call_deferred('add_child', obj)


func _on_selected_cats_changed(value: Array) -> void:
	for cat in selected_cats:
		if not value.has(cat): if is_instance_valid(cat): cat.deselected()
	for cat in value:
		if not selected_cats.has(value): if is_instance_valid(cat): cat.selected()
	
	selected_cats = value
