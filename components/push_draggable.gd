extends Draggable
class_name PushDraggable


@onready var parent: RigidBody2D = get_parent()
@export var speeds: Vector2 = Vector2(0.3,1.5)
var speed: float = randf_range(speeds.x, speeds.y)


func _drag():
	var global_mouse_position = parent.get_global_mouse_position()
	var direction: Vector2 = parent.global_position.direction_to(global_mouse_position)
	var distance: float = parent.global_position.distance_to(global_mouse_position)
	
	parent.apply_force(direction * distance * speed)
