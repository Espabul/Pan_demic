extends State


class_name JumpState


func enter():
	var character = state_machine.get_parent()
	character.velocity.y = character.JUMP_VELOCITY
	#animacion
	character.animacion.play("jump")
	character.jump.play()


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
	
	
func handle_input(event: InputEvent):
	var character = state_machine.get_parent()
	if Input.is_action_just_pressed("disparo") and character.can_shoot:
		state_machine.change_state("disparojumpstate")
	elif Input.is_action_just_pressed("dash") and character.can_dash:
		state_machine.change_state("dashstate")
	elif Input.is_action_just_pressed("ataque") and character.can_atk:
		state_machine.change_state("ataquestate")
	
