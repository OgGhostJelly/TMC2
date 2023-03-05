extends Control


func _ready() -> void:
	GameManager.game_won.connect(func(): visible = true)
	GameManager.game_started.connect(func(): visible = false)
