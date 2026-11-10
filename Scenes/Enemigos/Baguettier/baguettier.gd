extends CharacterBody2D

@export var enemy_health : int = 5

var direction = 1

var baguettier_death_effect = preload("res://Scenes/Enemigos/Baguettier/baguettier_death_effect.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_hurtbox_area_entered(area: Area2D) -> void:
	print("Hurtbox area entered")
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		enemy_health -= node.damage_amount
		print(enemy_health)
		if enemy_health <= 0:
			var baguettier_death_effect_instance = baguettier_death_effect.instantiate() as Node2D
			baguettier_death_effect_instance.global_position = global_position
			baguettier_death_effect_instance.flipped = direction<0
			get_parent().add_child(baguettier_death_effect_instance)
			
			queue_free()
