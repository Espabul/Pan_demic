extends State


class_name JumpState

func enter():
	print("Entering State Jump")
	var character = state_machine.get_parent()
	character.velocity.y = -1400
	
	


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	#gravedad
	character.velocity.y += 2000 * delta
	
	#movimiento horizontal
	var direction = Input.get_axis("mover izquierda", "mover_derecha")
	character.velocity.x = direction * 400
	
	character.move_and_slide()
	
	#volver al estado apropiado al aterrizar
	if character.is_on_floor():
		if direction !=0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")
