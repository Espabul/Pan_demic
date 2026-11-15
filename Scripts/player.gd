extends CharacterBody2D



var upgrades : int


const SPEED = 500.0
const JUMP_VELOCITY = -1800.0
const DASH_DURATION = 0.2
const DASH_COOLDOWN = 0.6
const DASH_VELOCITY = 1500
const ATK_COOLDOWN = 0.5
const SHOOT_COOLDOWN = 0.5
const HURT_COOLDOWN = 0.4

var can_dash = false
var can_atk = true
var can_shoot = false
var can_be_hit = true
var hurt_direction = 1
var hurtstate = false

@export var gravedad = 3000
@onready var animacion = $AnimatedSprite2D
@onready var dashtimer = $dashtimer
@onready var dash_cooldowntimer = $dash_cooldowntimer
@onready var atk_cooldowntimer = $atk_cooldowntimer
@onready var shoot_timer = $shoot_timer
@onready var hurt_cooldowntimer = $Hurt_cooldown
@onready var hit_animation = $HitAnimationPlayer




var proyect_flojo = preload("res://Scenes/player/proyectil_flojo.tscn")
var atk_proyect = preload("res://Scenes/player/atk_sweep.tscn")
var player_death_effect = preload("res://Scenes/player/player_death_effect.tscn")

func _ready() -> void:
	
	global_position = SceneManager.spawn_pos
	
	upgrades = SceneManager.upgrades
	if upgrades >=1:
		can_shoot = true
	if upgrades >=2:
		can_dash = true


func shoot_proyectile():
	var bullet_instance = proyect_flojo.instantiate() as Node2D
	
	var direction = -1 if animacion.flip_h else 1

	bullet_instance.direction = direction
	bullet_instance.global_position = global_position + Vector2(40 * direction, 0)
	bullet_instance.scale = Vector2(0.75, 0.75)
	
	get_tree().current_scene.add_child(bullet_instance)


func atk_proyectile():
	var atk_instance =  atk_proyect.instantiate() as Node2D
	
	var direction = animacion.flip_h

	atk_instance.flip_h = direction
	direction = -1 if animacion.flip_h else 1
	atk_instance.position = Vector2(230 * direction, 0)
	atk_instance.rotation = deg_to_rad(15 * direction)
	atk_instance.direction = direction
	
	add_child(atk_instance)



func _on_dash_cooldowntimer_timeout() -> void:
	if upgrades >= 1: can_dash = true


func _on_atk_cooldowntimer_timeout() -> void:
	can_atk = true


func _on_shoot_timer_timeout() -> void:
	if upgrades >= 2: can_shoot = true


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") and can_be_hit and not hurtstate:
		print("player hurt")
		if velocity.x < -200:
			hurt_direction = 1
		elif velocity.x >200:
			hurt_direction = -1
		elif body.global_position.x > global_position.x:
			hurt_direction = 1
		else:
			hurt_direction = -1
		
		hurtstate = true
		
		HealthManager.decrease_health(body.damage_amount)
		
		if HealthManager.current_health == 0:
			player_death()




func player_death():
	var camera = $Camera2D
	
	camera.position_smoothing_enabled = false
	camera.enabled = false
	var camera_pos = camera.global_position
	camera.reparent(get_tree().current_scene, true)
	camera.global_position = camera_pos
	camera.enabled = true
	
	await get_tree().create_timer(0.2).timeout
	var player_death_effect_instance = player_death_effect.instantiate() as Node2D
	player_death_effect_instance.global_position = global_position
	get_parent().add_child(player_death_effect_instance)
	
	if get_tree().current_scene.find_child("Pancio"):
		get_tree().current_scene.find_child("Pancio").queue_free()
	
	queue_free()
	
	SceneManager.transition_to_scene_checkpoint()


func _on_hurt_cooldown_timeout() -> void:
	can_be_hit = true


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy") and can_be_hit and not hurtstate:
		print("player hurt")
		if velocity.x < -200:
			hurt_direction = 1
		elif velocity.x >200:
			hurt_direction = -1
		elif area.global_position.x > global_position.x:
			hurt_direction = 1
		else:
			hurt_direction = -1
		
		hurtstate = true
		
		HealthManager.decrease_health(area.damage_amount)
		
		if HealthManager.current_health == 0:
			player_death()
