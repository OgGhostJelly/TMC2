extends GPUParticles2D
class_name ParticlesOnDeathComponent


@export var particle_time: float = 5.0
@export var health_component: HealthComponent


func _ready() -> void:
	health_component.died.connect(func():
		reparent(get_tree().current_scene)
		emitting = true
		await get_tree().create_timer(particle_time).timeout
		queue_free()
		)
