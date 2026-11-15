extends State

class_name PanWalkHoldState



func enter():
	var character = state_machine.get_parent()
	
	character.animation.play("Walk_hold")
	



func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	if  character.was_pancio_passed() and character.is_player_very_close():
		character.state_timer_end = false
		state_machine.change_state("panwalkendstate")
		return
	
	character.velocity.x = character.SPEED * character.last_direction * -3
	
	character.move_and_slide()
	
