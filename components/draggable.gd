extends Area2D
class_name Draggable


func _enter_tree() -> void:
	DragManager.connect_draggable(self)


func _drag() -> void:
	pass
