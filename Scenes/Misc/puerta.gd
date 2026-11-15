extends Sprite2D


@onready var animacion : AnimationPlayer = $AnimationPlayer

var abierta = false

func abrir():
	animacion.play("open")

func cerrar():
	animacion.play("open")
