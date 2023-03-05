extends Camera2D


@export var speed: float = 40.0
@export var fast_multiplier: float = 4.0


func _physics_process(delta: float) -> void:
	global_position.x += (speed if not Input.is_action_pressed("speed") else speed * fast_multiplier) * delta
