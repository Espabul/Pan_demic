extends State

class_name IdleState

func enter():
	print("Entering State Idle")




func handle_input(event: InputEvent):
	if Input.is_action_pressed("mover_derecha") or Input.is_action_pressed("mover izquierda"):
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("saltar"):
		state_machine.change_state("jumpstate")
	
