extends Node2D


var boss_control = 0

var boss = preload("res://Scenes/Enemigos/Pancio/pancio.tscn")
var key = preload("res://Scenes/Misc/llave.tscn")

@onready var detector = $DetectarJugador
@onready var player_ch = $Player

func _ready():
	if SceneManager.passed_fight_rooms >= 6:
		detector.queue_free()
		if SceneManager.key_obtained == false:
			var key_instance = key.instantiate() as Node2D
			key_instance.global_position = Vector2(1245, 0)
			get_parent().add_child(key_instance)





func _on_detectar_jugador_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and boss_control == 0:
		boss_control = 1
		var pancio_instance = boss.instantiate()
		pancio_instance.middle_position = 1245
		pancio_instance.close_range = 400
		pancio_instance.medium_range = 700
		pancio_instance.far_range = 1000
		pancio_instance.global_position.x = 1245
		pancio_instance.global_position.y = -81
		get_tree().current_scene.add_child(pancio_instance)
		
		detector.queue_free()
		
