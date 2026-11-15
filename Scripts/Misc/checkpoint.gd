extends Area2D

var activado = false


func _ready() -> void:
	$Sprite2D.play("Antes")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and activado== false:
		activado = true
		$Sprite2D.play("Guardar")
		SceneManager.set_checkpoint_scene(SceneManager.last_scene)
		DataManager.change_data()
		DataManager.save_data()


func _on_body_exited(body: Node2D) -> void:
	$Sprite2D.play("Después")
