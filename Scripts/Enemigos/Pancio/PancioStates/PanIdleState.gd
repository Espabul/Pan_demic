extends State

class_name PanIdleState



func enter():
	var character = state_machine.get_parent()
	
	if character.animation:
		character.animation.play("Idle")
	
	if character.state_timer:
		character.state_timer_end = false
		character.state_timer.wait_time = randf_range(1, 1.5)
		character.state_timer.start()
		


func physics_update(_delta: float):
	var character = state_machine.get_parent()
	
	character.direction = 1 if character.chased_player != null and character.is_player_left() else -1
	
	if character.direction != 0:
		character.change_scales_direction()
	
	if character.state_timer:
		if character.state_timer_end:
			character.last_direction = character.direction 
			character.state_timer_end = false
			state_machine.change_state(character.decide_action())
			return
	else:
		character.last_direction = character.direction
		character.state_timer_end = false
		state_machine.change_state("panidlestate")
		return
