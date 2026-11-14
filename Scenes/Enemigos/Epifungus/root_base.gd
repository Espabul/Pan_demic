extends Sprite2D


var hand = preload("res://Scenes/Enemigos/Epifungus/appendix_hand.tscn")
@onready var animacion = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2).timeout
	summon_hand()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func summon_hand():
	var hand_instance = hand.instantiate() as CharacterBody2D
	hand_instance.global_position = global_position
	hand_instance.global_position.x -= 30
	
	animacion.play("Summon")
	
	await get_tree().create_timer(1).timeout
	get_tree().current_scene.add_child(hand_instance)
	




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	animacion.play("Idle")
