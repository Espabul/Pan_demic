extends State

class_name BagHurtState


func enter():
	print("Baguettier hurts")
	var character = state_machine.get_parent()
	
	character.velocity.x = 0
	character.velocity.y = -500
	
	character.animation.play("Baguettier_hurt")
	character.damage_animation.play("damage_effect")
	
	character.timer.wait_time = 0.3
	character.timer.start()
	



func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	if character.timer.is_stopped():
		character.state_bag = character.last_state_bag
		state_machine.change_state(character.last_state_bag)
		return
	
	#gravity
	if not character.is_on_floor():
		character.velocity.y += character.GRAVITY * delta
	
	character.move_and_slide()
	
	
