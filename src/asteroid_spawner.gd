extends Node2D

@export var asteroid_scene : PackedScene

var spawn_timer: Timer

signal asteroid_hit

func _ready() -> void:
	spawn_timer = get_node("SpawnTimer")

func _on_timer_timeout() -> void:
	spawn_asteroid_border()
	spawn_timer.wait_time = randf_range(2.0, 8.0)
	spawn_timer.start()

func spawn_asteroid_border() -> void:
	var asteroid_position
	var asteroid_scale
	var i = randi()%2
	if i == 0:
		asteroid_position = Vector2(1000*randi()%2, randf_range(0, 1000))
	if i == 1:
		asteroid_position = Vector2(randf_range(0, 1000), 1000*randi()%2)
	var scale_fact = randf_range(0.4, 2.0)
	asteroid_scale = Vector2(scale_fact, scale_fact)
	spawn_asteroid(asteroid_position, asteroid_scale)

func split_asteroid(location : Vector2, original_scale : Vector2) -> void:
	if original_scale.x > 0.6:
		spawn_asteroid(location, 0.5 * original_scale)
		spawn_asteroid(location, 0.5 * original_scale)
	emit_signal("asteroid_hit")

func spawn_asteroid(location : Vector2, scale_factor : Vector2) -> void:
	var asteroid = asteroid_scene.instantiate()
	asteroid.position = location
	asteroid.spawner = self
	asteroid.scale = scale_factor
	get_parent().add_child(asteroid)
