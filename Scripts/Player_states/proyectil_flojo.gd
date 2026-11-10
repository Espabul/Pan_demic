extends AnimatedSprite2D

var speed: int = 1200
var direction: int

var damage_amount: int = 1

var bullet_impact_effect = preload("res://Scenes/player/bullet_impact_effect.tscn")

func _physics_process(delta: float):
	move_local_x(direction * speed * delta)


func _on_bullet_time_timeout() -> void:
	queue_free()


func _on_area_hitbox_area_entered(area: Area2D) -> void:
	print("Bullet entered area")
	bullet_impact()


func _on_area_hitbox_body_entered(body: Node2D) -> void:
	print("Bullet entered body")
	bullet_impact()


func get_damage_amount() -> int:
	return damage_amount



func bullet_impact():
	var bullet_impact_effect_instance = bullet_impact_effect.instantiate() as Node2D
	bullet_impact_effect_instance.global_position = global_position
	bullet_impact_effect_instance.flipped = direction<0
	get_parent().add_child(bullet_impact_effect_instance)
	
	queue_free()
