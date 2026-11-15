extends Camera2D


var velocidad = 300


func _process(delta: float) -> void:
	if Input.is_action_pressed("mover_derecha"):
		position.x += velocidad * delta
	if Input.is_action_pressed("mover izquierda"):
		position.x -= velocidad * delta
