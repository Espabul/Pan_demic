extends State

class_name WalkState

func enter():
	print("Entering State Walk")



func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("mover izquierda", "mover_derecha")
	
	if direction == 0:
		state_machine.change_state("idlestate")
		return
	
	character.velocity.x = direction * 600
	character.move_and_slide()



func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("saltar"):
		state_machine.change_state("jumpstate")
	
	
