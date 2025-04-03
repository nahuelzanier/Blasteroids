extends Area2D

func _on_area_exited(area: Area2D) -> void:
	if area.global_position.x > 1000:
		area.global_position.x = 0
	elif area.global_position.x < 0:
		area.global_position.x = 1000
	
	if area.global_position.y > 1000:
		area.global_position.y = 0
	elif area.global_position.y < 0:
		area.global_position.y = 1000
