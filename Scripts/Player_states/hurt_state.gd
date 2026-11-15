extends State

class_name HurtState


func enter():
	var character = state_machine.get_parent()
	#animacion
	character.hit_animation.play("Hit")
	character.animacion.play("daño")
	
	character.can_be_hit = false
	character.hurt_cooldowntimer.wait_time = character.HURT_COOLDOWN
	character.hurt_cooldowntimer.start()
	
	#movimiento repentino
	var direction = character.hurt_direction
	character.velocity.x = direction * 400
	
	character.velocity.y = -500
	
	character.hurt.play()


func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	
	#gravedad
	if not character.is_on_floor():
		character.velocity.y += character.gravedad * delta
	
	
	if character.hurt_cooldowntimer.is_stopped() and not character.is_on_floor:
		character.hurtstate = false
		state_machine.change_state("fallstate")
		return
	elif character.hurt_cooldowntimer.is_stopped():
		character.hurtstate = false
		state_machine.change_state("walkstate")
		return
	
	

	
	var direction = character.hurt_direction
	
	if direction != 0:
		character.animacion.flip_h = direction > 0
	
	character.move_and_slide()
	
	
