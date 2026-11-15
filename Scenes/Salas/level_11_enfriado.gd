extends Node2D


@onready var main_body = $Epifungus_main_body

var appendix_eye1_dead = false
var appendix_eye2_dead = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_appendix_eye_tree_exited() -> void:
	appendix_eye1_dead = false
	if appendix_eye2_dead:
		main_body.can_be_hit = true


func _on_appendix_eye_2_tree_exited() -> void:
	appendix_eye2_dead = false
	if appendix_eye1_dead:
		main_body.can_be_hit = true
