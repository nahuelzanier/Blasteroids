extends Area2D

var move_direction : Vector2
var speed : float = 1500
var erase_counter : int = 0

func _process(delta: float) -> void:
	position += move_direction * speed * delta
	erase_counter += 1
	if erase_counter > 20:
		call_deferred("queue_free")

func _on_area_entered(area: Area2D) -> void:
	area.call_deferred("split_asteroid")
	call_deferred("queue_free")
