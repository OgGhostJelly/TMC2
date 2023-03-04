extends Node2D


@export var speed: float = 1.0


func _physics_process(delta: float) -> void:
	rotation += speed * delta
