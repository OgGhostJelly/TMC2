extends VisibleOnScreenNotifier2D
class_name VisibleOnScreenKiller2D


@export var health: HealthComponent


func _ready() -> void:
	screen_exited.connect(func():
		health.health = 0
		)
