extends Node2D

@export var next_scene : String
@onready var door = $Door
@export var spawn_pos : Vector2

@export var room_advancer : int = 0



func _on_exit_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var player = body as CharacterBody2D
		
		var camera = player.get_node("Camera2D")
	
		camera.position_smoothing_enabled = false
		camera.enabled = false
		var camera_pos = camera.global_position
		camera.reparent(get_tree().current_scene, true)
		camera.global_position = camera_pos
		camera.enabled = true
		
		player.queue_free()
		
		door.play()
		await get_tree().create_timer(0.3).timeout
		
		
		SceneManager.advance_room(room_advancer)
		
		SceneManager.spawn_pos = spawn_pos
		SceneManager.transition_to_scene(next_scene)
