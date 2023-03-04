extends ProgressBar
class_name HealthBarComponent


@export var health_component: HealthComponent


func _ready() -> void:
	value = health_component.health
	
	health_component.health_changed.connect(func():
		value = health_component.health
		)
