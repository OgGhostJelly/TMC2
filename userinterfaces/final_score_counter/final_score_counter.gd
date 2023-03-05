extends Label


@onready var default_text: String = text


func _ready() -> void:
	GameManager.game_over.connect(update_text)


func update_text() -> void:
	text = default_text % GameManager.final_score
