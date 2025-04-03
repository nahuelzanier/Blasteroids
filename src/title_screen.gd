extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		get_parent().change_scene(get_parent().game)
