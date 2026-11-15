extends State

class_name AtaqueState

func enter():
	var character = state_machine.get_parent()
	#animacion
	if character.animacion:
		character.animacion.play("attack mele")
	
	character.can_atk = false
	character.atk_cooldowntimer.wait_time = character.ATK_COOLDOWN
	character.atk_cooldowntimer.start()
	
	character.atk_proyectile()
	
	character.punch.play()

func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	#gravedad
	if not character.is_on_floor():
		character.velocity.y += character.gravedad * delta
	
	
	if character.hurtstate:
		state_machine.change_state("hurtstate")
		return
	
	#dirección y movimiento
	var direction = Input.get_axis("mover izquierda", "mover_derecha")
	
	if direction != 0:
		character.animacion.flip_h = direction < 0
	
	if character.is_on_floor():
		character.velocity.x = 0
	
	
	
	character.move_and_slide()
	
	#volver al estado apropiado al comenzar la bajada
	if not character.animacion.is_playing():
		state_machine.change_state("fallstate")

func handle_input(event: InputEvent):
	if Input.is_action_pressed("mover_derecha") or Input.is_action_pressed("mover izquierda"):
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("saltar"):
		state_machine.change_state("jumpstate")
	elif Input.is_action_just_pressed("dash"):
		state_machine.change_state("dashstate")
