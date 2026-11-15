extends CanvasLayer

func mostrar_victoria():
	visible = true
	# Pausa el juego para que los enemigos o el tiempo se detengan
	get_tree().paused = true 


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu_scene.tscn")
