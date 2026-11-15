extends State

class_name PanBackState



func enter():
	print("Pancio Back state")
	var character = state_machine.get_parent()
	
	character.animation.play("Jump_atk")
	
	character.state_timer.wait_time = 0.5
	character.state_timer.start()



func physics_update(_delta: float):
	var character = state_machine.get_parent()
	
	
	if character.state_timer_end:
		character.state_timer_end = false
		state_machine.change_state("panbackholdstate")
		return
	
	
