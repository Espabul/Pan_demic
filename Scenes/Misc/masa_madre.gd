extends Area2D

@export var room_advancer : int = 0


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		SceneManager.advance_room(room_advancer)
		SceneManager.upgrades += 1
		body.upgrades = SceneManager.upgrades
		body.check_abilities()
		queue_free()
