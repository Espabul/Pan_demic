extends CharacterBody2D

@export var enemy_health : int = 3
@export var damage_amount : int = 1
@export var middle_position : int
@export var close_range : int
@export var medium_range : int
@export var far_range : int


const GRAVITY : int = 3000
const SPEED : int = 300


@onready var damage_animation = $Sprite2D/DamageEffect
@onready var animation = $Sprite2D/AnimationPlayer
@onready var state_timer = $StateTimer
@onready var sprite_pancio = $Sprite2D
@onready var atk_collision = $AttackCollision

var chased_player : CharacterBody2D


var direction = 1
var last_direction = 1
var next_action : String
var last_action_repeat = 1
var last_action : String

var state_timer_end = false


var pancio_death_effect = preload("res://Scenes/Enemigos/Pancio/pancio_death_effect.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chased_player = get_tree().current_scene.find_child("Player")




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass



func decide_action() -> String:
	if is_player_cornered():
		next_action = "panbackstate"
	elif is_player_very_close():
		next_action = "panexplodestate" if randf() < 0.5 else "panmeleestate"
	elif is_player_far():
		next_action = "panwalkstate" if randf() < 0.6 else "panjumpstate"
	elif is_player_close():
		next_action = "panmeleestate" if randf() < 0.5 else "panwalkstate"
	else:
		next_action = "panbackstate" if randf() < 0.4 else "panjumpstate"
	if last_action == next_action:
		last_action_repeat +=1
	if last_action_repeat == 2:
		reroll_action()
		last_action_repeat = 0
	last_action = next_action
	return next_action


func reroll_action():
	if last_action == "panmeleestate":
		next_action = "panexplodestate" if randf() < 0.5 else "panjumpstate"
	elif last_action == "panjumpstate":
		next_action = "panmeleestate"
	elif last_action == "panbackstate":
		next_action = "panexplodestate"


func dist_to_middle(body) -> int:
	return abs(body.global_position.x - middle_position)

func pancio_too_far():
	return dist_to_middle(self) > far_range


func is_player_cornered() -> bool:
	return dist_to_middle(self) > far_range and dist_to_middle(self) < dist_to_middle(chased_player)

func is_player_close() -> bool:
	return abs(global_position.x - chased_player.global_position.x) < close_range

func is_player_very_close() -> bool:
	return abs(global_position.x - chased_player.global_position.x) < close_range -100

func is_player_far() -> bool:
	return abs(global_position.x - chased_player.global_position.x) > medium_range


func is_player_left() -> bool:
	return global_position.x - chased_player.global_position.x > 0


func change_scales_direction():
	sprite_pancio.scale.x = direction
	atk_collision.scale.x = direction


func was_pancio_passed() -> bool:
	return (last_direction == 1 and is_player_left()) or (last_direction == -1 and not is_player_left())


func _on_hurtbox_area_entered(area: Area2D) -> void:
	print("Hurtbox area entered")
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		enemy_health -= node.damage_amount
		damage_animation.play("damage_effect")
		print(enemy_health)
		if enemy_health <= 0:
			var pancio_death_effect_instance = pancio_death_effect.instantiate() as Node2D
			
			pancio_death_effect_instance.global_position = global_position
			pancio_death_effect_instance.flip_h = direction>0
			get_parent().add_child(pancio_death_effect_instance)
			
			
			queue_free()




func _on_state_timer_timeout() -> void:
	state_timer_end = true
