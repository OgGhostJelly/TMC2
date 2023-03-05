extends Control


func _ready() -> void:
	GameManager.game_over.connect(func(): visible = true)
	GameManager.game_start.connect(func(): visible = false)
