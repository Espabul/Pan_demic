extends State

class_name PanExplodeState


func enter():
	var character = state_machine.get_parent()
	
	character.animation.play("Explode")
	
	character.state_timer.wait_time = 1.5
	character.state_timer.start()


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	if character.state_timer_end and character.animation.current_animation == "Explode":
		character.state_timer_end = false
		state_machine.change_state("panidlestate")
		return
