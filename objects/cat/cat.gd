extends RigidBody2D
class_name Cat


@export var speeds: Vector2 = Vector2(0.3,1.5)
var speed: float = randf_range(speeds.x, speeds.y)
var distance_to_mouse_squared: float = 0.0
@onready var sprite: AnimatedSprite2D = $Sprite2D


func move():
	var global_mouse_position = get_global_mouse_position()
	var direction: Vector2 = global_position.direction_to(global_mouse_position)
	var distance: float = global_position.distance_to(global_mouse_position)
	
	apply_force(direction * distance * speed)


func update_distance_to_mouse_squared() -> void:
	distance_to_mouse_squared = get_global_mouse_position().distance_squared_to(global_position)


func selected() -> void: sprite.modulate = Color.GREEN
func deselected() -> void: sprite.modulate = Color.WHITE
