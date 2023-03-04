extends RigidBody2D
class_name Cat


@export var speed: float = 1.5
@onready var sprite: AnimatedSprite2D = $Sprite2D


func move():
	var global_mouse_position = get_global_mouse_position()
	var direction: Vector2 = global_position.direction_to(global_mouse_position)
	var distance: float = global_position.distance_to(global_mouse_position)
	
	apply_force(direction * distance * speed)


func selected() -> void: sprite.modulate = Color.GREEN
func deselected() -> void: sprite.modulate = Color.WHITE
