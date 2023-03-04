extends Area2D


@export var damage: float = 1.0


func _process(delta: float) -> void:
	for area in get_overlapping_areas():
		if not area is HurtboxComponent: return
		area.hit(delta * damage)
