extends Node2D




func _on_scene_end_timer_timeout() -> void:
	SceneManager.set_checkpoint_scene("Level1_Amasadora")
	SceneManager.transition_to_scene("Level1_Amasadora")
