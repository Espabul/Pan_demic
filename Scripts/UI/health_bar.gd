extends Node2D


@export var bread_bar_image : Texture2D

@onready var bread_bar = $BreadBar


func _ready() -> void:
	HealthManager.on_health_changed.connect(on_player_health_changed)


func on_player_health_changed(player_current_health : int):
	bread_bar.frame = 5 - player_current_health
