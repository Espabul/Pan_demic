extends State

class_name PanBackHoldState



func enter():
	print("Pancio Back Hold state")
	var character = state_machine.get_parent()
	
	character.animation.play("Jump_hold")
	
	character.velocity.y = -1400


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	var temp_direction = -1 if character.global_position.x > character.middle_position else 1

	if character.dist_to_middle(character) < character.close_range:
		character.state_timer_end = false
		state_machine.change_state("panbackendstate")
		return
	
	

	character.velocity.y = move_toward(character.velocity.y, 0, 80*delta)
	character.velocity.x = 800 * temp_direction * 2

	
	character.move_and_slide()
	
