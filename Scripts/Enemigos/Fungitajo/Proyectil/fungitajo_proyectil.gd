extends Area2D

@export var velocidad = 500
@export var direccion = Vector2(Vector2.LEFT)
var impactando = false


func _ready()-> void:
	$AnimatedSprite2D.play("Volar")
	if direccion.x >0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false


func _physics_process(delta: float)->void:
	if impactando == true:
		return
	position += direccion * velocidad * delta


func _on_body_entered(body: Node2D) -> void:
	if impactando == true:
		return
	impactando = true
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D.play("Impacto")
	await get_tree().create_timer(0.4).timeout
	queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	pass
