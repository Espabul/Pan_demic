extends State

class_name DisparoState

func enter():
	var character = state_machine.get_parent()
	#animacion
	if character.animacion:
		character.animacion.play("shoot")
	
	character.can_shoot = false
	character.shoot_timer.wait_time = character.SHOOT_COOLDOWN
	character.shoot_timer.start()
	
	character.shoot_proyectile()


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	#movimiento horizontal
	var direction = Input.get_axis("mover izquierda", "mover_derecha")
	character.velocity.x = direction * 400
	
	if character.hurtstate:
		state_machine.change_state("hurtstate")
		return
	
	if direction != 0:
		character.animacion.flip_h = direction < 0

	
	character.move_and_slide()
	
	#volver al estado apropiado al comenzar la bajada
	if not character.animacion.is_playing() and not character.is_on_floor():
		state_machine.change_state("fallstate")
	elif not character.animacion.is_playing():
		state_machine.change_state("idlestate")
