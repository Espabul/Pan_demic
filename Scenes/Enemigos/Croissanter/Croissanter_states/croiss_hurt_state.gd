extends State

class_name CroissHurtState


func enter():
	print("Croissanter hurts")
	var character = state_machine.get_parent()
	
	character.velocity.x = 0
	character.velocity.y = -500
	
	character.animation.play("Croissanter_Hurt")
	character.damage_animation.play("damage_effect")
	
	character.timer.wait_time = 0.3
	character.timer.start()
	



func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	if character.timer.is_stopped():
		character.state_croiss = "croisspatrolstate"
		state_machine.change_state(character.state_croiss)
		return
	
	#gravity
	if not character.is_on_floor():
		character.velocity.y += character.GRAVITY * delta
	
	character.move_and_slide()
	
	
