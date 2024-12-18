extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -350.0

var _is_dead := false

@onready var animte2d := $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and not _is_dead:
		velocity.y = JUMP_VELOCITY
		$JumpSFX.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction < 0:
		animte2d.flip_h = true
	elif direction > 0:
		animte2d.flip_h = false

	if not _is_dead:
		if is_on_floor():
			if direction:
				animte2d.play("run")
			else:
				animte2d.play("idle")
		else:
			animte2d.play("jump")

	if direction and not _is_dead:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func dead():
	_is_dead = true
	animte2d.play("dead")
