extends CharacterBody2D


var speed = 75
var player_chase = false
var player = null
var disparado = null

var enemy_health = 1
var damage_amount : int = 1

@onready var animacion = $Sprite2D/AnimationPlayer
@onready var collision_shape = $CollisionShape2D

func _ready():
	if disparado != null:
		velocity.x = disparado * 800
	

func _physics_process(delta: float) -> void:
	
	velocity.x = move_toward(velocity.x, 0, delta * 900)
	
	if player_chase:
		position += (player.position - position)/ speed
		
		if (player.position.x - position.x) < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
	
	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	

func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
	



func _on_hurtbox_area_entered(area: Area2D) -> void:
	print("Hurtbox area entered")
	if area.get_parent().has_method("get_damage_amount"):
		collision_shape.set_deferred("disabled", true)
		animacion.play("die")





func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
