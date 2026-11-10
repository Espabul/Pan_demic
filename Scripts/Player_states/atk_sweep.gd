extends AnimatedSprite2D

var direction: int



func _on_atk_time_timeout() -> void:
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	print ("mele entered")



func _on_hitbox_body_entered(body: Node2D) -> void:
	print ("mele entered")
