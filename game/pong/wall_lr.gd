extends Node2D

@export var amplitude: float = 200.0
@export var speed: float = 0.4
@export var is_horizontal: bool = true

var start_position: Vector2

func _ready():
	start_position = position

func _process(delta):
	var current_offset = amplitude * sin(Time.get_ticks_msec() / 1000.0 * speed * 2 * PI)

	if is_horizontal:
		position.x = start_position.x + current_offset
		position.y = start_position.y
	else:
		position.x = start_position.x
		position.y = start_position.y + current_offset
