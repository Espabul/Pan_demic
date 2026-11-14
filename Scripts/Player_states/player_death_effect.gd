extends Node2D




func _on_animation_death_timer_timeout() -> void:
	queue_free()
