extends CharacterBody2D

@export var vida = 2
@export var velocidad = 300
@export var rango = 400
@export var gravedad = 2000

var detectar_jugador = null
var tiempo = 0.0
var direccion = Vector2(Vector2.LEFT)
var pos_x = 0.0
var pos_y = 0.0
var estado = "volando"


func _ready() -> void:
	$AnimatedSprite2D.play("Volar")
	pos_x = global_position.x
	pos_y = global_position.y
	$AnimatedSprite2D.flip_h = false
	

func _physics_process(delta: float)->void:
	if estado == "volando":
		if global_position.x >= pos_x + rango:
			$AnimatedSprite2D.flip_h = false
			direccion = Vector2.LEFT
		if global_position.x <= pos_x - rango:
			$AnimatedSprite2D.flip_h = true
			direccion = Vector2.RIGHT
		velocity = Vector2(direccion * velocidad)
	
	if estado == "cayendo":
		velocity.x = 0
		velocity.y += gravedad * delta
	move_and_slide()
	if estado == "cayendo" and is_on_floor() ==true:
		estado = "en_suelo"
		tiempo = 2.0
		velocity = Vector2(0,0)
		print("En el suelo")
		

func _on_detección_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and estado == "volando":
		detectar_jugador = body
		estado = "cayendo"
		print("Flybun cae")
		$AnimatedSprite2D.play("Caer")
		

func _on_detección_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		detectar_jugador = null
