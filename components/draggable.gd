extends Area2D
class_name Draggable

signal dragged


func _enter_tree() -> void:
	DragManager.connect_draggable(self)


func __drag() -> void:
	dragged.emit()
	_drag()


func _drag() -> void:
	pass
