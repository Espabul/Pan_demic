extends Node


var game_data : GameDataResource

var save_data_path = "user://game_data/"
var save_file_name = "game_data.tres"


func load_data():
	if !DirAccess.dir_exists_absolute(save_data_path):
		DirAccess.make_dir_absolute(save_data_path)
	
	if ResourceLoader.exists(save_data_path + save_file_name):
		game_data = ResourceLoader.load(save_data_path + save_file_name)
		
	if game_data == null:
		game_data = GameDataResource.new()
		reset_data()
	
	if game_data != null:
		SceneManager.set_checkpoint_scene(game_data.checkpoint_scene)
		SceneManager.upgrades = game_data.upgrades
		SceneManager.key_obtained = game_data.key_obtained
		SceneManager.passed_fight_rooms = game_data.passed_fight_rooms



func save_data():
	ResourceSaver.save(game_data, save_data_path + save_file_name)


func change_data():
	game_data.checkpoint_scene = SceneManager.last_scene
	game_data.upgrades = SceneManager.upgrades
	game_data.key_obtained = SceneManager.key_obtained
	game_data.passed_fight_rooms = SceneManager.passed_fight_rooms


func reset_data():
	game_data.checkpoint_scene = "cinematica"
	game_data.upgrades = 0
	game_data.key_obtained = false
	game_data.passed_fight_rooms = 0
