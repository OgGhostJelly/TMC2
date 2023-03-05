extends Node



const GRAB_AMOUNT: int = 3
const MAX_DISTANCE: float = 50.0
var selected_drag_items: Array = []: set = _on_selected_drag_items_changed


func _physics_process(_delta: float) -> void:
	for drag_item in selected_drag_items: if can_use_method(drag_item, '_drag'): drag_item._drag()


func _input(event: InputEvent) -> void:
	if not event.is_action("move"): return
	selected_drag_items = [] if not event.is_pressed() else get_drag_items().slice(0,GRAB_AMOUNT)


func get_drag_items() -> Array:
	
	var drag_items: Array = get_tree().get_nodes_in_group('drag_items')
	var distance_squared: Dictionary = {}
	for x in drag_items: distance_squared[x] = x.get_global_mouse_position().distance_squared_to(x.global_position)
	
	# sort drag_items by distance from mouse with 0 being closest
	drag_items.sort_custom(func(a,b):
		return distance_squared[a] < distance_squared[b]
		)
	
	# remove all drag_items that are further than max_distance_squared from the mouse
	var max_distance_squared: float = pow(MAX_DISTANCE, 2)
	for i in drag_items.size():
		if distance_squared[drag_items[i]] > max_distance_squared:
			drag_items = drag_items.slice(0, i)
			break
	
	return drag_items


func _on_selected_drag_items_changed(value: Array) -> void:
	for drag_item in selected_drag_items as Array[Node]:
		if value.has(drag_item): return
		if not can_use_method(drag_item, '_deselected'): return
		drag_item._deselected()
	
	for drag_item in value:
		if selected_drag_items.has(value): return
		if not can_use_method(drag_item, '_selected'): return
		drag_item._selected()
	
	selected_drag_items = value


func can_use_method(node: Node, method: String):
	return is_instance_valid(node) and node.has_method(method)
