extends AnimatedSprite2D

var speed: int = 1200
var direction: int


func _physics_process(delta: float):
	move_local_x(direction * speed * delta)


func _on_bullet_time_timeout() -> void:
	queue_free()
