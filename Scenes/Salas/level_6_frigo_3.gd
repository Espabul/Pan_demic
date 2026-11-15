extends Node2D


var boss_control = 0

var boss = preload("res://Scenes/Enemigos/Pancio/pancio.tscn")
var key = preload("res://Scenes/Misc/llave.tscn")

@onready var detector = $DetectarJugador


func _on_detectar_jugador_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var pancio_instance = boss.instantiate()
		pancio_instance.middle_position = 1245
		pancio_instance.close_range = 400
		pancio_instance.medium_range = 700
		pancio_instance.far_range = 1000
		pancio_instance.global_position.x = 1245
		pancio_instance.global_position.y = -81
		get_tree().current_scene.add_child(pancio_instance)
		
		detector.queue_free()
		
