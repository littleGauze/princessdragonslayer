extends Node2D

signal coin_emitted(amount: int)

@export var coin_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_emitted.connect(on_coin_emitted)


func on_coin_emitted(amount: int) -> void:
	generate_coin(amount)

func generate_coin(amount: int = 1):
	for i in range(amount):
		var coin = coin_scene.instantiate() as RigidBody2D
		coin.position = Vector2(0, -16)
		call_deferred("add_child", coin)
		var dir = random_dir()
		coin.apply_central_impulse(dir * 300 * (randf() + .4))

func random_dir():
	var angle = PI / 6 - randf() * (PI / 3) + PI / 2
	return Vector2(cos(angle), -sin(angle))
