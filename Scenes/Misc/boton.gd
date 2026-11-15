extends Sprite2D


var activado = false

@onready var collision_enable = $Area2D/CollisionShape2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		collision_enable.set_deferred("disabled", true)
		frame = 1
		activado = true
