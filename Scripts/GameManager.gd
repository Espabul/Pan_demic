extends Node


var pause_menu_screen = preload("res://Scenes/UI/pause_menu_scene.tscn")
var main_menu_screen = preload("res://Scenes/UI/main_menu_scene.tscn")

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color(0.79, 0.525, 0.23, 1.0))
	
	DataManager.load_data()



func start_game():
	if get_tree().paused:
		continue_game()
		return
	
	SceneManager.transition_to_scene(DataManager.game_data.checkpoint_scene)

func restart_game():
	SceneManager.transition_to_scene("cinematica")

func quit_game():
	DataManager.save_data()
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
