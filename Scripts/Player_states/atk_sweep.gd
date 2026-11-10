extends AnimatedSprite2D

var direction: int



func _on_atk_time_timeout() -> void:
	queue_free()
