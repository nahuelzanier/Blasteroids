extends Node2D

var points_label: Label
var points : int = 0

func _ready() -> void:
	points_label = get_node("Points")

func _on_player_player_destroyed() -> void:
	await get_tree().create_timer(3).timeout
	get_parent().change_scene(get_parent().title_screen)

func _on_asteroid_spawner_asteroid_hit() -> void:
	points += 1
	points_label.text = str(points)
