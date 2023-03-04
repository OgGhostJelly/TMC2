extends Area2D
class_name HurtboxComponent


@export var health_component: HealthComponent


func hit(damage: float):
	health_component.health -= damage
