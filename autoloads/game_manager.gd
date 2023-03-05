extends Node

signal game_over
signal game_start
signal score_changed


@export var score: int = 0:
	set(v): score = v; score_changed.emit()
var final_score: int = 0

var last_nodes_in_group_cats: Array[Node]


func _ready() -> void:
	game_over.connect(_on_game_over)
	game_start.connect(_on_game_start)


func _on_game_over() -> void:
	Engine.time_scale = 0.1
	final_score = score
	score = 0


func _on_game_start() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _process(_delta: float) -> void:
	var nodes_in_group_cats: Array[Node] = get_tree().get_nodes_in_group('cats')
	if nodes_in_group_cats == last_nodes_in_group_cats: return
	if nodes_in_group_cats.size() <= 1: game_over.emit()
	last_nodes_in_group_cats = nodes_in_group_cats


func start_game() -> void:
	game_start.emit()
