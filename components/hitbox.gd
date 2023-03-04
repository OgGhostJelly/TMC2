extends Area2D
class_name HitboxComponent


@export var damage: float = 1.0


func _ready() -> void:
	area_entered.connect(func(area: Area2D):
		if not area is HurtboxComponent: return
		area.hit(damage)
		)
