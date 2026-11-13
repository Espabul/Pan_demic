extends State

class_name EpiWaitState


func enter():
	await get_tree().create_timer(5).timeout
