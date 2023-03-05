extends Timer
class_name GainScoreTimerComponent


@export var change: int = 1


func _ready() -> void:
	timeout.connect(change_score)
	GameManager.game_over.connect(func(): timeout.disconnect(change_score))

func change_score() -> void:
	GameManager.score += change
