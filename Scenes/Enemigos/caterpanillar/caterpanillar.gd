extends CharacterBody2D

@export var vida : int = 2
@export var damage_amount:int = 1
@export var rango = 400

const gravedad = 1000
const velocidad = 300.0
var direccion = Vector2(Vector2.LEFT)
var pos_x = 0.0


func _ready() -> void:
	$AnimatedSprite2D.play("Caminar")
	pos_x = global_position.x
	$AnimatedSprite2D.flip_h = false
	

func _physics_process(delta: float)->void:
	if global_position.x >= pos_x + rango:
		$AnimatedSprite2D.flip_h = false
		direccion = Vector2.LEFT
	if global_position.x <= pos_x - rango:
		$AnimatedSprite2D.flip_h = true
		direccion = Vector2.RIGHT
	velocity = Vector2(direccion * velocidad)
	move_and_slide()
	

func recibir_daño(cantidad):
	vida -= cantidad
	if vida<= 0:
		queue_free()
	else:
		$AnimatedSprite2D/AnimationPlayer.play("Daño")
		
		
func _on_hurtbox_area_entered(area: Area2D) -> void:
	recibir_daño(1)
	print("Caterpanillar golpeado")
