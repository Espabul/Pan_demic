extends Area2D

var activado = false
@export var checkpoint_scene : String
@export var room_advancer : int = 0



func _ready() -> void:
	$Sprite2D.play("Antes")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and activado== false:
		activado = true
		$Sprite2D.play("Guardar")
		SceneManager.advance_room(room_advancer)
		SceneManager.set_checkpoint_scene(checkpoint_scene)
		SceneManager.check_spawn_pos = global_position
		DataManager.change_data()
		DataManager.save_data()


func _on_body_exited(body: Node2D) -> void:
	$Sprite2D.play("Después")
