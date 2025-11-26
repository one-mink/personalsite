extends CharacterBody2D
const SPEED = 600

func _process(delta):
	var direction = 0

	if Input.is_action_pressed("ui_left"):
		direction = -1
	elif Input.is_action_pressed("ui_right"):
		direction = 1
	velocity.x = direction * SPEED

func _physics_process(delta):
	move_and_slide()
