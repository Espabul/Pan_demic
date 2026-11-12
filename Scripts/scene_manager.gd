extends Node



var scenes : Dictionary = {"Level1_Amasadora": "res://Scenes/Salas/Level1_Amasadora.tscn",
							"LevelTEST": "res://Scenes/Salas/LevelTEST.tscn"}

var transition_caterpanillar_screen = preload("res://Scenes/UI/scene_transition_screen.tscn")

func transition_to_scene(level : String):
	var scene_path : String = scenes.get(level)
	
	if scene_path != null:
		
		play_transition_animation()
		await get_tree().create_timer(0.6).timeout
		get_tree().change_scene_to_file(scene_path)
		


func play_transition_animation():
	var transition_caterpanillar_screen_instance = transition_caterpanillar_screen.instantiate()
	get_tree().get_root().add_child(transition_caterpanillar_screen_instance)
	
