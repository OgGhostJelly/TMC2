extends Control


func _ready() -> void:
	GameManager.game_loss.connect(func(): visible = true)
	GameManager.game_started.connect(func(): visible = false)
