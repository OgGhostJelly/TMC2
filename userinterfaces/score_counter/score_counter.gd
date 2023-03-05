extends Label


@onready var default_text: String = text


func _ready() -> void:
	GameManager.score_changed.connect(update_text)
	update_text()


func update_text() -> void:
	text = default_text % GameManager.score
