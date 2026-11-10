extends State

class_name FallState

func enter():
	print("Entering State fall")
	var character = state_machine.get_parent()
	#animacion
	character.animacion.play("jump_fall")



func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	#gravedad
	character.velocity.y += character.gravedad * delta
	
	#movimiento horizontal
	var direction = Input.get_axis("mover izquierda", "mover_derecha")
	character.velocity.x = direction * 400
	
	if direction != 0:
		character.animacion.flip_h = direction < 0
	
	character.move_and_slide()
	
	
	
	
#volver al estado apropiado al aterrizar
	if character.is_on_floor():
		if direction !=0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")

func handle_input(event: InputEvent):
	var character = state_machine.get_parent()
	if Input.is_action_just_pressed("dash") and character.can_dash:
		state_machine.change_state("dashstate")
	elif Input.is_action_just_pressed("disparo") and character.can_shoot:
		state_machine.change_state("disparofallstate")
	elif Input.is_action_just_pressed("disparoplus") and character.can_shoot:
		state_machine.change_state("disparoplusfallstate")
	elif Input.is_action_just_pressed("ataque") and character.can_atk:
		state_machine.change_state("ataquestate")
		
		
