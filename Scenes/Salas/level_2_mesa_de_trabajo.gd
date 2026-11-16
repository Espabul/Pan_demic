extends Node2D


@onready var boton = $Boton
@onready var puerta = $Puerta
@onready var masa = $MasaMadre

func _ready():
	if SceneManager.passed_fight_rooms >= 2:
		puerta.abrir()
		boton.pulsar()
		masa.queue_free()

func _process(delta: float) -> void:
	
	if boton.activado and puerta.abierta == false:
		puerta.abrir()
		puerta.abierta = true
		
