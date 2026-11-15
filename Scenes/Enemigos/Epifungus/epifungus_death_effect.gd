extends AnimatedSprite2D




func _on_timer_timeout() -> void:
	SceneManager.transition_to_scene("pantalla_final")
	queue_free()
