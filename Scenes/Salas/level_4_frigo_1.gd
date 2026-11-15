extends Node2D


@onready var puerta = $Puerta


func _ready() -> void:
	cerrar_sala()
	if SceneManager.key_obtained:
		abrir_sala()
	

func abrir_sala():
	puerta.abrir()


func cerrar_sala():
	puerta.cerrar()
