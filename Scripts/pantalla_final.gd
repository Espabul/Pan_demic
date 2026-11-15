extends CanvasLayer

func mostrar_victoria():
	visible = true
	# Pausa el juego para que los enemigos o el tiempo se detengan
	get_tree().paused = true 

func _on_boton_reiniciar_pressed():
	# Siempre despausa el árbol antes de cambiar o recargar escenas
	get_tree().paused = false
	get_tree().reload_current_scene()
