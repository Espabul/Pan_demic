extends Node2D


@export var spawn_pos : Vector2

func _on_scene_end_timer_timeout() -> void:
	SceneManager.spawn_pos = spawn_pos
	SceneManager.set_checkpoint_scene("Level1_Amasadora")
	SceneManager.transition_to_scene("Level1_Amasadora")
