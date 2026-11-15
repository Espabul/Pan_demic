extends Node2D


var boss_control = 0

var boss = preload("res://Scenes/Enemigos/Pancio/pancio.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if boss_control == 0:
		boss_control = 1
		
		var pancio_instance = boss.instantiate()
		pancio_instance.middle_position = 1245
		pancio_instance.close_range = 400
		pancio_instance.medium_range = 700
		pancio_instance.far_range = 1000
