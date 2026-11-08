extends StaticBody2D

@export var cooldown = 2.0
@export var proyectil_escena: PackedScene

var detectar_jugador = null
var esta_atacando = false
var contar_tiempo = 0.0
var distancia_marker = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	distancia_marker = abs($Marker2D.position.x)
	$AnimatedSprite2D.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	contar_tiempo -= delta
	if detectar_jugador != null and not esta_atacando and contar_tiempo <= 0:
		mirar_jugador()
		esta_atacando = true
		$AnimatedSprite2D.play("Attack")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		detectar_jugador = body
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		detectar_jugador = null
		
func mirar_jugador()->void:
	if detectar_jugador == null:
		return
	var a_la_derecha = detectar_jugador.global_position.x > global_position.x
	$AnimatedSprite2D.flip_h = a_la_derecha
	if a_la_derecha:
		$Marker2D.position.x = distancia_marker
	else:
		$Marker2D.position.x = -distancia_marker

func disparar()->void:
	var proyectil = proyectil_escena.instantiate()
	if $AnimatedSprite2D.flip_h:
		proyectil.direccion = Vector2.RIGHT
	else:
		proyectil.direccion = Vector2.LEFT
	get_parent().add_child(proyectil)
	proyectil.global_position = $Marker2D.global_position
		
func _on_animated_sprite_2d_animation_finished() -> void:
	if esta_atacando:
		esta_atacando = false
		$AnimatedSprite2D.play("Idle")
		contar_tiempo = cooldown


func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.animation == "Attack" and $AnimatedSprite2D.frame == 6:
		disparar()
