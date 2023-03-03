extends CharacterBody2D


@export var speed: float = 1000.0


func _input(event: InputEvent) -> void:
	if not event is InputEventMouseMotion: return
	velocity = global_position.direction_to(get_global_mouse_position()) * speed


func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	velocity = Vector2.ZERO
