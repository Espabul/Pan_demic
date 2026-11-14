extends Node



var scenes : Dictionary = {"Checkpoint" : "res://Scenes/Salas/Level1_Amasadora.tscn",
							"Level1_Amasadora": "res://Scenes/Salas/Level1_Amasadora.tscn",
							"LevelTEST": "res://Scenes/Salas/LevelTEST.tscn"}

var last_scene : String = "Level1_Amasadora"

var transition_caterpanillar_screen = preload("res://Scenes/UI/scene_transition_screen.tscn")

var upgrades : int = 0


func transition_to_scene(level : String):
	var scene_path : String = scenes.get(level)
	
	if scene_path != null:
		last_scene = level
		DataManager.change_data()
		play_transition_animation()
		await get_tree().create_timer(0.6).timeout
		get_tree().change_scene_to_file(scene_path)
		


func transition_to_scene_checkpoint():
	await get_tree().create_timer(0.6).timeout
	transition_to_scene("Checkpoint")
	HealthManager.increase_health(10)


func play_transition_animation():
	var transition_caterpanillar_screen_instance = transition_caterpanillar_screen.instantiate()
	get_tree().get_root().add_child(transition_caterpanillar_screen_instance)
	

func set_checkpoint_scene(level: String):
	scenes.set("Checkpoint", scenes.get(level))
