extends CharacterBody2D

@export var enemy_health : int = 5
@export var damage_amount : int = 1

@export var patrol_point_xpos : int = 0
@export var patrol_range : int = 100


const GRAVITY : int = 3000
const SPEED : int = 300


@onready var sprite_bag = $Sprite2D
@onready var damage_animation = $Sprite2D/DamageEffect
@onready var animation = $Sprite2D/AnimationPlayer
@onready var timer = $Timer
@onready var atk_collision = $Attack_collision
@onready var daño = $Daño


var state_bag = "bagwalkstate"
var last_state_bag = "bagwalkstate"
var chased_player_body : CharacterBody2D


var direction = 1


var baguettier_death_effect = preload("res://Scenes/Enemigos/Baguettier/baguettier_death_effect.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if direction != 0:
		sprite_bag.scale.x = float(direction * -1)
		
	if direction == 1:
		atk_collision.position.x = 130
	elif direction == -1:
		atk_collision.position.x = -130
	



func _on_hurtbox_area_entered(area: Area2D) -> void:
	print("Hurtbox area entered")
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		enemy_health -= node.damage_amount
		state_bag = "baghurtstate"
		print(enemy_health)
		if enemy_health <= 0:
			var baguettier_death_effect_instance = baguettier_death_effect.instantiate() as Node2D
			if direction == 1:
				baguettier_death_effect_instance.global_position.y = global_position.y
				baguettier_death_effect_instance.global_position.x = global_position.x
			elif direction ==-1:
				baguettier_death_effect_instance.global_position.y = global_position.y
				baguettier_death_effect_instance.global_position.x = global_position.x
				
			baguettier_death_effect_instance.flipped = direction>0
			get_parent().add_child(baguettier_death_effect_instance)
			
			queue_free()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		chased_player_body = body as CharacterBody2D
		
		if state_bag != "baghurtstate":
			state_bag = "bagchasestate"
	
		last_state_bag = "bagchasestate"



func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if state_bag != "baghurtstate":
			state_bag = "bagwalkstate"
		
		last_state_bag = "bagwalkstate"
