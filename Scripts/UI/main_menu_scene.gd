extends CanvasLayer


func _on_play_button_pressed() -> void:
	DataManager.load_data()
	GameManager.start_game()
	queue_free()


func _on_exit_button_pressed() -> void:
	GameManager.quit_game()




func _on_new_game_button_pressed() -> void:
	DataManager.load_data()
	DataManager.reset_data()
	DataManager.save_data()
	DataManager.load_data()
	GameManager.restart_game()
	queue_free()
