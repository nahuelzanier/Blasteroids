extends Area2D

@export var proyectile_scene : PackedScene

var rotation_speed : float = 1.5
var acceleration : float = 5.0
var max_speed : float = 700.0

var velocity : Vector2 = Vector2.ZERO

var ship_tip : Marker2D
var proyectile_container: Node

var can_shoot : bool = true

signal player_destroyed

func _ready() -> void:
	ship_tip = get_node("ShipTip")
	proyectile_container = get_node("ProyectileContainer")

func _process(delta: float) -> void:
	rotation += Input.get_axis("left", "right") * rotation_speed * delta
	var direction = ship_tip.global_position - global_position
	if Input.is_action_pressed("forward"):
		velocity += (direction).normalized() * acceleration
	if velocity.length() > max_speed:
		velocity -= (direction).normalized() * acceleration
	position += velocity * delta

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot") and can_shoot:
		can_shoot = false
		var proyectile = proyectile_scene.instantiate()
		proyectile.position = ship_tip.global_position
		proyectile.move_direction = (ship_tip.global_position - global_position).normalized()
		proyectile_container.add_child(proyectile)
		await get_tree().create_timer(0.5).timeout
		can_shoot = true

func _on_area_entered(area: Area2D) -> void:
	area.call_deferred("split_asteroid")
	call_deferred("queue_free")
	emit_signal("player_destroyed")
