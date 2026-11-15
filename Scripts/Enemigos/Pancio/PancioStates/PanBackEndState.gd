extends State

class_name PanBackEndState



func enter():
	print("Pancio Back End state")
	var character = state_machine.get_parent()
	
	character.animation.play("Jump_end")
	
	character.state_timer.wait_time = 0.5
	character.state_timer.start()



func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	if character.state_timer_end and character.is_on_floor():
		character.state_timer_end = false
		state_machine.change_state("panidlestate")
		return
		
	
	#gravity
	if not character.is_on_floor():
		character.velocity.y += 4000 * delta
	
	character.move_and_slide()
	
