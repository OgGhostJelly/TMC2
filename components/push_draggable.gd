extends Draggable
class_name PushDraggable


@onready var parent: RigidBody2D = get_parent()
@export var speed: float = 0.5


func _drag():
	parent.apply_force(Input.get_last_mouse_velocity() * speed)
