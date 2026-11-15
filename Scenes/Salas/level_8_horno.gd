extends Node2D


@onready var boton = $Boton
@onready var puerta = $Puerta


func _process(delta: float) -> void:
	
	if boton.activado and puerta.abierta == false:
		puerta.abrir()
		puerta.abierta = true
		
