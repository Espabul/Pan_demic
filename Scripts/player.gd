
extends CharacterBody2D
 

const SPEED = 400.0
const JUMP_VELOCITY = -700.0


const DASH_SPEED = 1000.0
const DASH_DURATION = 0.2
const DASH_COOLDOWN = 0.5



var is_dashing = false
var dash_timer = 0.0
var cooldown_timer = 0.0
var facing_direction = 1


func _physics_process(delta: float) -> void:

	# Dirección del personaje
	var direction := Input.get_axis("mover izquierda", "mover_derecha")

	if not is_dashing:
		if direction > 0:
			facing_direction = 1
		elif direction < 0:
			facing_direction = -1

	# Cooldown
	if cooldown_timer > 0:
		cooldown_timer -= delta

	# Activar dash
	if Input.is_action_just_pressed("dash") and cooldown_timer <= 0 and not is_dashing:
		is_dashing = true
		dash_timer = DASH_DURATION
		cooldown_timer = DASH_COOLDOWN

	# Movimiento del dash
	if is_dashing:
		velocity.x = facing_direction * DASH_SPEED
		velocity.y = 0

		dash_timer -= delta

		if dash_timer <= 0:
			is_dashing = false

	else:
		# Gravedad
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Salto
		if Input.is_action_just_pressed("saltar") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Movimiento normal
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
