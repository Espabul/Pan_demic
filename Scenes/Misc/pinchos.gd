extends Area2D



@export var damage_amount = 1
@export var respawn_pos : Vector2

@onready var collision_enable = $CollisionShape2D




func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		collision_enable.set_deferred("disabled", true)
		SceneManager.play_transition_animation()
		
		
		await get_tree().create_timer(0.4).timeout
		
		collision_enable.set_deferred("disabled", false)
		body.global_position = respawn_pos
