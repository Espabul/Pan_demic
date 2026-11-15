extends Node2D


@onready var puerta = $Puerta
@onready var puerta2 = $Puerta2
@onready var puerta3 = $Puerta3

var muertos = false

func _ready() -> void:
	cerrar_sala()
	
	

func _process(delta: float) -> void:
	pass
	


func abrir_sala():
	puerta.abrir()
	puerta2.abrir()
	puerta3.abrir()

func cerrar_sala():
	puerta.cerrar()
	puerta2.cerrar()
	puerta3.cerrar()
