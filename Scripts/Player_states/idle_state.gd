extends State

class_name IdleState

func enter():
	var character = state_machine.get_parent()
	#animacion
	if character.animacion:
		character.animacion.play("idle")
	

func physics_update(delta: float):
	var character = state_machine.get_parent()
	if character.hurtstate:
		state_machine.change_state("hurtstate")
		return

func handle_input(event: InputEvent):
	var character = state_machine.get_parent()
	if Input.is_action_pressed("mover_derecha") or Input.is_action_pressed("mover izquierda"):
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("saltar"):
		state_machine.change_state("jumpstate")
	elif Input.is_action_just_pressed("dash") and character.can_dash:
		state_machine.change_state("dashstate")
	elif Input.is_action_just_pressed("ataque") and character.can_atk:
		state_machine.change_state("ataquestate")
	elif Input.is_action_just_pressed("disparo") and character.can_shoot:
		state_machine.change_state("disparostate")
