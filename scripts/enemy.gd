extends CharacterBody2D

enum EnemyType {
	ENEMY_1,
	ENEMY_2,
}

const SPEED := 50.0

@export var type: EnemyType = EnemyType.ENEMY_1

var direction := 1
var anim: AnimatedSprite2D


func _ready() -> void:
	if type == EnemyType.ENEMY_1:
		anim = $Enemy1
	else:
		anim = $Enemy2
	anim.visible = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if direction == 1 and $RayRight.is_colliding():
		direction = -1

	if direction == -1 and $RayLeft.is_colliding():
		direction = 1

	anim.flip_h = direction == -1

	var current_state: StateChartState = $StateChart._state._active_state

	if direction and current_state and current_state.name == "Walking":
		velocity.x = direction * SPEED

	move_and_slide()


func _on_idle_state_entered() -> void:
	anim.play("idle")


func _on_awake_state_entered() -> void:
	anim.play("awake")


func _on_walking_state_entered() -> void:
	anim.play("walking")


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body.name == "Player":
		direction = 1 if _body.position.x > position.x else -1
	$StateChart.send_event("Awake")


func _on_animated_sprite_2d_animation_finished() -> void:
	if $StateChart._state._active_state.name == "Awake":
		$StateChart.send_event("Walking")
