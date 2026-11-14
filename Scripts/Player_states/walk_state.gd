extends State

class_name WalkState

func enter():
	print("Entering State Walk")
	var character = state_machine.get_parent()
	#animacion
	character.animacion.play("run")

func physics_update(delta: float):
	
	var character = state_machine.get_parent()
	var direction = Input.get_axis("mover izquierda", "mover_derecha")
	
	if character.hurtstate:
		state_machine.change_state("hurtstate")
		return
	
	
	if !character.is_on_floor():
		print("Entering fall")
		state_machine.change_state("fallstate")
		return
	
	if direction != 0:
		character.animacion.flip_h = direction < 0
	
	if direction == 0:
		state_machine.change_state("idlestate")
		return
	
	character.velocity.x = direction * character.SPEED
	
	character.move_and_slide()
	


func handle_input(event: InputEvent):
	var character = state_machine.get_parent()
	if Input.is_action_just_pressed("saltar"):
		state_machine.change_state("jumpstate")
	elif Input.is_action_just_pressed("dash") and character.can_dash:
		state_machine.change_state("dashstate")
	elif Input.is_action_just_pressed("ataque") and character.can_atk:
		state_machine.change_state("ataquestate")
	elif Input.is_action_just_pressed("disparo") and character.can_shoot:
		state_machine.change_state("disparostate")
	
	
