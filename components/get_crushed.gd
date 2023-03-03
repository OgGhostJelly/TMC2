extends Area2D
class_name GetCrushed


@export var max_crush: int = 0


func _ready() -> void:
	area_entered.connect(i_have_a_crush)
	area_exited.connect(i_have_a_crush)


func i_have_a_crush(_area: Area2D) -> void:
	if get_overlapping_areas().size() >= max_crush:
		get_parent().queue_free()
