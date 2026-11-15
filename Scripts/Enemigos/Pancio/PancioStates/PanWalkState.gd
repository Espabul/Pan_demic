extends State

class_name PanWalkState



func enter():
	var character = state_machine.get_parent()
	
	character.animation.play("Walk_start")
	
	character.state_timer.wait_time = 0.5
	character.state_timer.start()
	


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	if character.state_timer_end:
		character.state_timer_end = false
		state_machine.change_state("panwalkholdstate")
		return
	
	
	
