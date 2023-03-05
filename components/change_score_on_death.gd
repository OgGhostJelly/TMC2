extends Node
class_name ChangeScoreOnDeathComponent


@export var change: int = -5
@export var health_component: HealthComponent


func _ready() -> void:
	health_component.died.connect(func(): GameManager.score += change)
