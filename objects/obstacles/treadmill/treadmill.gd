extends Area2D


@export var push_force: Vector2


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group('cats'): return
	body = body as RigidBody2D
	body.apply_force(push_force)
