extends CharacterBody2D



var health = 5
var upgrades = 3



const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH_DURATION = 0.2
const DASH_COOLDOWN = 0.6
const DASH_VELOCITY = 1500
const ATK_COOLDOWN = 0.5
const SHOOT_COOLDOWN = 0.5

var can_dash = false
var can_atk = true
var can_shoot = false

@export var gravedad = 3000
@onready var animacion = $AnimatedSprite2D
@onready var dashtimer = $dashtimer
@onready var dash_cooldowntimer = $dash_cooldowntimer
@onready var atk_cooldowntimer = $atk_cooldowntimer
@onready var shoot_timer = $shoot_timer

var proyect_flojo = preload("res://Scenes/player/proyectil_flojo.tscn")
var atk_proyect = preload("res://Scenes/player/atk_sweep.tscn")


func _ready() -> void:
	if upgrades >=1:
		can_dash = true
	if upgrades >=2:
		can_shoot = true


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
	
	add_child(atk_instance)


func _on_dash_cooldowntimer_timeout() -> void:
	if upgrades >= 1: can_dash = true


func _on_atk_cooldowntimer_timeout() -> void:
	can_atk = true


func _on_shoot_timer_timeout() -> void:
	if upgrades >= 2: can_shoot = true
