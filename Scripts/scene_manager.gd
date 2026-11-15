extends Node



var scenes : Dictionary = {"Checkpoint" : "res://Scenes/Salas/Level1_Amasadora.tscn",
							"Level1_Amasadora": "res://Scenes/Salas/Level1_Amasadora.tscn",
							"LevelTEST": "res://Scenes/Salas/LevelTEST.tscn",
							"level_2_mesa_de_trabajo": "res://Scenes/Salas/level_2_mesa_de_trabajo.tscn",
							"level_3_mesa_de_trabajo": "res://Scenes/Salas/level_3_mesa_de_trabajo.tscn",
							"level_4_frigo": "res://Scenes/Salas/level_4_frigo_1.tscn",
							"level_5_frigo": "res://Scenes/Salas/level_5_frigo_2.tscn"}


var last_scene : String = "Level1_Amasadora"
var level_name = "Level1_Amasadora"

var transition_caterpanillar_screen = preload("res://Scenes/UI/scene_transition_screen.tscn")

var upgrades : int = 0

var spawn_pos : Vector2


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
	if last_scene == "Checkpoint":
		last_scene = level_name


func play_transition_animation():
	var transition_caterpanillar_screen_instance = transition_caterpanillar_screen.instantiate()
	get_tree().get_root().add_child(transition_caterpanillar_screen_instance)
	

func set_checkpoint_scene(level: String):
	scenes.set("Checkpoint", scenes.get(level))
	level_name = level
