extends Area2D


@export var disabled: bool = false


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group('cats'): return
	if disabled: return
	
	disabled = true
	
	# amount of cats in game
	var cat_count: int = get_tree().get_nodes_in_group('cats').size()
	# amount of cats to spawn
	var spawn_amount: int = int(pow(cat_count, 2)) - cat_count
	# time between spawns
	var spawn_time: float = 0.01 / float(spawn_amount)
	
	for i in spawn_amount:
		await get_tree().create_timer(spawn_time, false).timeout
		CatManager.spawn_cat(global_position + Vector2(randf_range(-16, 16), randf_range(-16, 16)))
	
	queue_free()
