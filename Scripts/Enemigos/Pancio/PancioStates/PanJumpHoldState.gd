extends State

class_name PanJumpHoldState



func enter():
	var character = state_machine.get_parent()
	
	character.animation.play("Jump_hold")
	
	character.velocity.y = -1400


func physics_update(delta: float):
	var character = state_machine.get_parent()
	

	if character.is_player_close() or character.pancio_too_far():
		character.state_timer_end = false
		state_machine.change_state("panjumpendstate")
		return
	
	

	character.velocity.y = move_toward(character.velocity.y, 0, 80*delta)
	character.velocity.x = abs(character.global_position.x - character.chased_player.global_position.x) * character.last_direction * -2

	
	character.move_and_slide()
	
