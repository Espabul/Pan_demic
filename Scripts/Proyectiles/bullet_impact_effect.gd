extends AnimatedSprite2D

var flipped = false

func _ready() -> void:
	if flipped:
		flip_h = true
	

func _on_timer_timeout() -> void:
	queue_free()
