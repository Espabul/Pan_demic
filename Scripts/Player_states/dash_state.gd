extends State

class_name DashState




func enter():
	print("Entering State Dash")
	var character = state_machine.get_parent()
	#animacion
	character.animacion.play("dash")
	
	character.dashtimer.wait_time = character.DASH_DURATION
	character.dashtimer.start()
	character.can_dash = false
	character.dash_cooldowntimer.wait_time = character.DASH_COOLDOWN
	character.dash_cooldowntimer.start()



func physics_update(delta: float):
	
	var character = state_machine.get_parent()
	var direction = character.animacion.flip_h
	if direction == true:
		direction = -1
	else:
		direction = 1
	
	if character.dashtimer.is_stopped() and not character.is_on_floor:
		state_machine.change_state("fallstate")
		return
	elif character.dashtimer.is_stopped():
		state_machine.change_state("walkstate")
		return
	
	
	character.velocity.x = direction * character.DASH_VELOCITY
	character.velocity.y = 0
	
	character.move_and_slide()
	
	
	
