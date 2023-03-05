extends RigidBody2D


@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	constant_force = Vector2.from_angle(atan2(position.y, position.x) - PI/2) * speed

