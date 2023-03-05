extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group('cats'): return
	GameManager.win_game()
