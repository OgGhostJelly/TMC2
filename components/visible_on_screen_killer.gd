extends Node2D


@export var health: HealthComponent


func _process(_delta: float) -> void:
	var viewport_size: Vector2 = get_viewport_rect().size
	var viewport_position: Vector2 = -get_viewport_transform().origin

	if (
		global_position.x < viewport_position.x or # exited left
		global_position.y < viewport_position.y or # exited top
		global_position.y > viewport_position.y + viewport_size.y # exited bottom
		): health.health = 0
