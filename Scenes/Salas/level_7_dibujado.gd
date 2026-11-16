extends Node2D


@onready var masa = $MasaMadre


func _ready():
	if SceneManager.passed_fight_rooms >= 7:
		masa.queue_free()
