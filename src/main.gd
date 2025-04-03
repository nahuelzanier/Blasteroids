extends Node2D

@export var title_screen : PackedScene
@export var game : PackedScene

var current_scene

func _ready() -> void:
	current_scene = title_screen.instantiate()
	add_child(current_scene)

func change_scene(scene) -> void:
	current_scene.queue_free()
	current_scene = scene.instantiate()
	add_child(current_scene)
