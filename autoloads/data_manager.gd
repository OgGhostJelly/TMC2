extends Node

signal score_changed


@export var score: int = 0.0:
	set(v): score = v; score_changed.emit()
