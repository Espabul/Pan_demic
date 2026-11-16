extends Node2D


@onready var boton = $Boton
@onready var puerta = $Puerta
@onready var puerta2 = $Puerta2

func _ready():
	if SceneManager.passed_fight_rooms >= 8:
		puerta.abrir()
		puerta2.abrir()
		boton.pulsar()



func _process(delta: float) -> void:
	
	if boton.activado and puerta.abierta == false:
		puerta.abrir()
		puerta2.abrir()
		puerta.abierta = true
		puerta2.abierta = true
		
