extends Area2D


@export var damage: float = 0.5


func _ready() -> void:
	area_entered.connect(func(area: Area2D):
		if not area is HurtboxComponent: return
		area.hit(damage)
		)
