extends State

class_name BagAttackState

func enter():
	print("Baguettier attacks")
	var character = state_machine.get_parent()
	
	character.animation.play("Baguettier_attack")
	
	character.timer.wait_time = 1
	character.timer.start()
	
	character.velocity.x = 0


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	if character.timer.is_stopped():
		state_machine.change_state(character.last_state_bag)
		return
	
	
	
	#gravity
	if not character.is_on_floor():
		character.velocity.y += character.GRAVITY * delta
	else:
		character.velocity.y = 0
		
	
	character.move_and_slide()
	
	
