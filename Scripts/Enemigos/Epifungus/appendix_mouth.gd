extends CharacterBody2D


@export var enemy_health : int = 7
@export var damage_amount : int = 1

var direction = 1
var app_mouth_death_effect = preload("res://Scenes/Enemigos/Epifungus/Death_effects/mouth_death_effect.tscn")
var zumbon_spit = preload("res://Scenes/Enemigos/zumbon/zumbon.tscn")


@onready var animacion = $Sprite2D/AnimationPlayer
@onready var dmg_animacion = $Sprite2D/DamageEffect
@onready var spawn_timer = $SpawnTimer
@onready var daño = $Daño
@onready var collision_shape = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if spawn_timer:
		spawn_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func spit():
	if animacion.current_animation == "Idle":
		animacion.play("Spit")
		daño.play()
	
	var zumbon_instance =  zumbon_spit.instantiate() as CharacterBody2D
	
	zumbon_instance.global_position = collision_shape.global_position
	zumbon_instance.disparado = direction
	get_tree().current_scene.add_child(zumbon_instance)






func _on_spawn_timer_timeout() -> void:
	spit()
	spawn_timer.start()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if animacion.current_animation != "Death":
		animacion.play("Idle")


func _on_hurtbox_area_entered(area: Area2D) -> void:
	print("Hurtbox area entered")
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		enemy_health -= node.damage_amount
		dmg_animacion.play("damage_effect")
		
		print(enemy_health)
		if enemy_health <= 0:
			var app_mouth_death_effect_instance = app_mouth_death_effect.instantiate() as Node2D
			app_mouth_death_effect_instance.global_position = global_position
			app_mouth_death_effect_instance.flipped = direction<0
			get_parent().add_child(app_mouth_death_effect_instance)
			
			queue_free()
