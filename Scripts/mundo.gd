extends Node

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("sair"):
		get_tree().quit()
