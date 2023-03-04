extends Node


var selected_cat: Cat = null: set = _on_selected_cat_changed


func _physics_process(_delta: float) -> void:
	if not is_instance_valid(selected_cat): return
	selected_cat.move()


func _input(event: InputEvent) -> void:
	if not event.is_action("move"): return
	selected_cat = null if not event.is_pressed() else get_closest_cat()


func get_closest_cat() -> Cat:
	var global_mouse_position: Vector2 = get_tree().current_scene.get_global_mouse_position()
	var closest_cat: Cat = null
	var closest_distance: float = INF
	
	for cat in get_tree().get_nodes_in_group('cats'):
		var distance: float = global_mouse_position.distance_squared_to(cat.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closest_cat = cat
	
	return closest_cat


func spawn_cat(position: Vector2) -> void:
	var cat: PackedScene = preload("res://objects/cat/cat.tscn")
	var obj: Node2D = cat.instantiate()
	obj.global_position = position
	get_tree().current_scene.call_deferred('add_child', obj)


func _on_selected_cat_changed(value: Cat) -> void:
	if not selected_cat == value:
		if is_instance_valid(value): value.selected()
		if is_instance_valid(selected_cat): selected_cat.deselected()
	
	selected_cat = value
