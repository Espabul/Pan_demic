extends Node2D


@onready var main_body = $Epifungus_main_body
@onready var playable = $Player

@onready var eye1 = $AppendixEye
@onready var eye2 = $AppendixEye2

var appendix_eye1_dead = false
var appendix_eye2_dead = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneManager.upgrades = 3
	playable.check_abilities()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if appendix_eye1_dead == false and eye1 and eye1.enemy_health <=1:
		print("eye1 dead")
		appendix_eye1_dead = true
	if appendix_eye2_dead == false and eye2 and eye2.enemy_health <=1:
		print("eye2 dead")
		appendix_eye2_dead = true
	
	if appendix_eye1_dead and appendix_eye2_dead and main_body and main_body.can_be_hit == false:
		main_body.can_be_hit = true
