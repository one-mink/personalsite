extends CharacterBody2D

const INITIAL_SPEED = 600

signal point_scored
signal game_over

var direction = Vector2.UP.rotated(randf_range(-PI/4, PI/4))
var speed = INITIAL_SPEED
var start_pos: Vector2

func _ready():
	start_pos = position
	reset_ball()

func _physics_process(delta):
	velocity = direction * speed
	var collision = move_and_slide()
	
	if collision:
		for i in range(get_slide_collision_count()):
			var collision_data = get_slide_collision(i)
			direction = direction.bounce(collision_data.get_normal())
			
			# Punktelogik: Kollision mit der OBEREN WAND
			if collision_data.get_normal().is_equal_approx(Vector2(0, 1)):
				emit_signal("point_scored")
				speed *= 1.00
			
			# Paddle-Treffer
			elif collision_data.get_collider().name == "Paddle":
				speed *= 1.00

	# Verloren-Logik: Ball verlässt den UNTEREN Rand
	if position.y > get_viewport_rect().size.y:
		emit_signal("game_over")
		queue_free()
		
func reset_ball():
	position = start_pos
	speed = INITIAL_SPEED
	direction = Vector2.UP.rotated(randf_range(-PI/4, PI/4))
