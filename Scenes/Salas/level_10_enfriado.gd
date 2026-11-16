extends Node2D


@onready var boton = $Boton
@onready var puerta = $Puerta


func _ready():
	if SceneManager.passed_fight_rooms >= 10:
		puerta.abrir()
		boton.pulsar()




func _process(delta: float) -> void:
	
	if boton.activado and puerta.abierta == false:
		puerta.abrir()
		puerta.abierta = true
		
