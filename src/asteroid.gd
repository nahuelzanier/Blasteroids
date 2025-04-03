extends Area2D

var spawner

var speed : float = 100.0
var direction : Marker2D

func _ready() -> void:
	direction = $MoveDirection
	var vertices = []
	for v in get_node("CollisionPolygon2D").polygon:
		vertices.push_back(v * randf_range(0.8, 1.2))
	var col_polygon = PackedVector2Array(vertices)
	get_node("CollisionPolygon2D").polygon = col_polygon
	get_node("Polygon2D").polygon = col_polygon
	rotation = randf_range(0, 2*PI)
	speed = speed * randf_range(0.2, 2.0)

func _process(delta: float) -> void:
	position += (direction.global_position - global_position).normalized() * speed * delta

func split_asteroid() -> void:
	spawner.split_asteroid(position, scale)
	queue_free()
