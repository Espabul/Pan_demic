extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		SceneManager.upgrades += 1
		body.upgrades = SceneManager.upgrades
		queue_free()
