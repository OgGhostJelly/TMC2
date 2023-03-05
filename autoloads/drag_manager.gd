extends Node



var grab_amount: int = 3
var hovered_draggables: Array = []
var selected_draggables: Array = []: set = _on_selected_draggables_changed


func _physics_process(_delta: float) -> void:
	grab_amount = round(get_tree().get_nodes_in_group('cats').size() / 2.0)
	for v in selected_draggables: if is_instance_valid(v) and v.has_method('_drag'): v._drag()


func _input(event: InputEvent) -> void:
	if not event.is_action("move"): return
	
	if event.is_pressed():
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		if selected_draggables.is_empty(): return
		var positions: Array = selected_draggables.filter(func(x): return x and is_instance_valid(x))
		positions = selected_draggables.map(func(x): return x.get_global_transform_with_canvas().origin)
		var averaged_vector: Vector2 = positions.reduce(func(accum, vec): return ( vec + accum ) / 2, positions.pop_front())
		get_viewport().warp_mouse(averaged_vector)
	
	selected_draggables = hovered_draggables if event.is_pressed() else []


func _on_selected_draggables_changed(value: Array) -> void:
	# Pre-calculate distance squared
	var distance_squared: Dictionary = {}
	for x in value:
		if not is_instance_valid(x): value.erase(x); continue
		distance_squared[x] = x.get_global_mouse_position().distance_squared_to(x.global_position)
	
	# Sort by closest
	value.sort_custom(func(a, b):
		return distance_squared[a] < distance_squared[b]
		)
	
	# Cap max grab amount
	selected_draggables = value.slice(0, grab_amount)


func draggable_mouse_entered(draggable: Area2D) -> void: hovered_draggables.append(draggable)
func draggable_mouse_exited(draggable: Area2D) -> void: hovered_draggables.erase(draggable)


func connect_draggable(draggable: Area2D) -> void:
	draggable.mouse_entered.connect(draggable_mouse_entered.bind(draggable))
	draggable.mouse_exited.connect(draggable_mouse_exited.bind(draggable))

func disconnect_draggable(draggable: Area2D) -> void:
	draggable.mouse_entered.disconnect(draggable_mouse_entered.bind(draggable))
	draggable.mouse_exited.connect(draggable_mouse_exited.bind(draggable))
