extends Label


@onready var default_text: String = text


func _process(_delta: float) -> void: text = default_text % get_tree().get_nodes_in_group('cats').size()
