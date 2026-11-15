extends State

class_name PanMeleeState


func enter():
	var character = state_machine.get_parent()
	
	character.animation.play("Melee_atk")
	
	character.state_timer.wait_time = 1.4
	character.state_timer.start()

func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	if character.state_timer_end and character.animation.current_animation == "Melee_atk":
		character.state_timer_end = false
		state_machine.change_state("panidlestate")
		return
	
