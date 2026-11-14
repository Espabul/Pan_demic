extends State

class_name BagChaseState


func enter():
	print("Baguettier chases")
	var character = state_machine.get_parent()
	
	character.animation.play("Baguettier_walk")


func physics_update(delta: float):
	var character = state_machine.get_parent()
	var xpos = character.global_position.x - 130 * character.direction
	
	if character.state_bag == "baghurtstate":
		state_machine.change_state("baghurtstate")
		return
	if character.state_bag == "bagwalkstate":
		state_machine.change_state("bagwalkstate")
		return
	
	
	character.direction = 1 if (xpos < character.chased_player_body.global_position.x) else -1
	
	if abs(xpos - character.chased_player_body.global_position.x) <= 350 and character.direction ==1:
		state_machine.change_state("bagattackstate")
		return
	elif abs(xpos - character.chased_player_body.global_position.x) <= 350 and character.direction ==-1:
		state_machine.change_state("bagattackstate")
		return
	
	#gravity
	if not character.is_on_floor():
		character.velocity.y += character.GRAVITY * delta
	else:
		character.velocity.y = 0
	
	#Movement
	character.velocity.x = character.direction * character.SPEED
	
	character.move_and_slide()
