extends AnimatedSprite2D


var key = preload("res://Scenes/Misc/llave.tscn")

func _on_timer_timeout() -> void:
	var key_instance = key.instantiate() as Node2D
	key_instance.global_position = global_position
	get_parent().add_child(key_instance)
	
	SceneManager.advance_room(6)
	
	queue_free()
