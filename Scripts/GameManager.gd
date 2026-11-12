extends Node


var levels : Dictionary = {"Level1_Amasadora": "res://Scenes/Salas/Level1_Amasadora.tscn"}
var pause_menu_screen = preload("res://Scenes/UI/pause_menu_scene.tscn")
var main_menu_screen = preload("res://Scenes/UI/main_menu_scene.tscn")

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color(0.79, 0.525, 0.23, 1.0))



func start_game():
	if get_tree().paused:
		continue_game()
		return
	
	transition_to_scene(levels.get("Level1_Amasadora"))



func quit_game():
	get_tree().quit()



func pause_game():
	get_tree().paused = true
	
	var pause_menu_screen_instance = pause_menu_screen.instantiate()
	get_tree().get_root().add_child(pause_menu_screen_instance)



func continue_game():
	get_tree().paused = false



func main_menu():
	var main_menu_screen_instance = main_menu_screen.instantiate()
	get_tree().get_root().add_child(main_menu_screen_instance)


func transition_to_scene(scene_path):
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file(scene_path)
