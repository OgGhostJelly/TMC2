extends Draggable
class_name PushDraggable


@onready var parent: RigidBody2D = get_parent()
@export var speed: float = 0.1
@export var max_speed: float = 500.0


func _drag():
	parent.apply_force( (Input.get_last_mouse_velocity() * speed).limit_length(max_speed) )
