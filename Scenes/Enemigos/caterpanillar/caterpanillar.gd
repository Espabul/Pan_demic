extends CharacterBody2D


const GRAVITY = 1000
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var enemy_health : int = 2



func _physics_process(delta: float):
	enemy_gravity(delta)
	
	
	move_and_slide()


func enemy_gravity(delta: float):
	velocity.y += GRAVITY * delta








func _on_hurtbox_area_entered(area):
	print("hurtbox")
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		enemy_health -= node.damage_amount
		print(enemy_health)
