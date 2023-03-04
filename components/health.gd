extends Node
class_name HealthComponent

signal health_changed
signal died


@export var health: float = 5.0: set = _on_health_changed


func _on_health_changed(value: float) -> void:
	health = value
	
	if health <= 0:
		get_parent().queue_free()
		died.emit()
	
	health_changed.emit()
