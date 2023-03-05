extends Node

signal game_won
signal game_loss
signal game_started
signal score_changed


var last_nodes_in_group_cats: Array[Node]


func _ready() -> void:
	game_loss.connect(_on_game_loss)
	game_started.connect(_on_game_started)
	game_won.connect(_on_game_won)


func _on_game_loss() -> void:
	Engine.time_scale = 0.1


func _on_game_started() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_game_won() -> void:
	Engine.time_scale = 0.1


func _process(_delta: float) -> void:
	var nodes_in_group_cats: Array[Node] = get_tree().get_nodes_in_group('cats')
	if nodes_in_group_cats == last_nodes_in_group_cats: return
	if nodes_in_group_cats.size() <= 1: game_loss.emit()
	last_nodes_in_group_cats = nodes_in_group_cats


func start_game() -> void:
	game_started.emit()

func win_game() -> void:
	game_won.emit()
