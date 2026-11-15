extends State

class_name PanWalkEndState



func enter():
	var character = state_machine.get_parent()
	
	character.animation.play("Walk_end")
	
	character.state_timer.wait_time = 0.7
	character.state_timer.start()
	
	character.velocity.x = 0


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	if character.state_timer_end:
		character.state_timer_end = false
		state_machine.change_state("panidlestate")
		return
	
	
	
