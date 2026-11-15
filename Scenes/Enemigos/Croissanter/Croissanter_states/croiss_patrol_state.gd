extends State

class_name CroissPatrolState



func enter():
	print("Croissanter walks")
	var character = state_machine.get_parent()
	
	if character.animation:
		character.animation.play("Croissanter_walk")


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	if character.state_croiss == "croisshurtstate":
		state_machine.change_state("croisshurtstate")
		return
	
	if character.global_position.x < (character.patrol_point_xpos - character.patrol_range):
		character.direction = 1
	elif character.global_position.x > (character.patrol_point_xpos + character.patrol_range):
		character.direction = -1
	
	
	#gravity
	if not character.is_on_floor():
		character.velocity.y += character.GRAVITY * delta
	else:
		character.velocity.y = 0
	
	#Movement
	character.velocity.x = character.direction * character.SPEED
	
	
	character.move_and_slide()
