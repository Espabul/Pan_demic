extends State

class_name DisparojumpState

func enter():
	var character = state_machine.get_parent()
	#animacion
	character.animacion.play("shoot jump")
	
	character.can_shoot = false
	character.shoot_timer.wait_time = character.SHOOT_COOLDOWN
	character.shoot_timer.start()
	
	character.shoot_proyectile()


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	#gravedad
	character.velocity.y += character.gravedad * delta
	
	if character.hurtstate:
		state_machine.change_state("hurtstate")
		return
	
	#movimiento horizontal
	var direction = Input.get_axis("mover izquierda", "mover_derecha")
	character.velocity.x = direction * character.SPEED
	
	if direction != 0:
		character.animacion.flip_h = direction < 0
	
	character.move_and_slide()
	
	#volver al estado apropiado al comenzar la bajada
	if character.velocity.y >= 0 and not character.animacion.is_playing():
		state_machine.change_state("fallstate")
	
