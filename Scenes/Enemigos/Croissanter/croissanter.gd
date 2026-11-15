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



var direction = 1
var state_croiss = "croisspatrolstate"

var croissanter_death_effect = preload("res://Scenes/Enemigos/Croissanter/croissanter_death_effect.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if direction != 0:
		sprite_bag.scale.x = float(direction * -1)
	




func _on_hurtbox_area_entered(area: Area2D) -> void:
	print("Hurtbox area entered")
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		enemy_health -= node.damage_amount
		state_croiss = "croisshurtstate"
		print(enemy_health)
		if enemy_health <= 0:
			var croissanter_death_effect_instance = croissanter_death_effect.instantiate() as Node2D
			if direction == 1:
				croissanter_death_effect_instance.global_position.y = global_position.y
				croissanter_death_effect_instance.global_position.x = global_position.x
			elif direction ==-1:
				croissanter_death_effect_instance.global_position.y = global_position.y
				croissanter_death_effect_instance.global_position.x = global_position.x
				
			croissanter_death_effect_instance.flipped = direction>0
			get_parent().add_child(croissanter_death_effect_instance)
			
			queue_free()
