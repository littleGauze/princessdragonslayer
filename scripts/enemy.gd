extends CharacterBody2D


const SPEED = 500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	var direction := 1

	if $RayLeft.is_colliding():
		direction = 1

	if $RayRight.is_colliding():
		direction = -1

	print(direction)
	if direction:
		velocity.x = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_idle_state_entered() -> void:
	$AnimatedSprite2D.play("idle")

func _on_awake_state_entered() -> void:
	$AnimatedSprite2D.play("awake")

func _on_walking_state_entered() -> void:
	$AnimatedSprite2D.play("walking")

func _on_area_2d_body_entered(_body: Node2D) -> void:
	$StateChart.send_event("Awake")

func _on_animated_sprite_2d_animation_finished() -> void:
	if $StateChart._state._active_state.name == "Awake":
		$StateChart.send_event("Walking")