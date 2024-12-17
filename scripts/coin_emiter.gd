extends Node2D

@export var Coin: PackedScene

signal coin_emitted(amount: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_emitted.connect(on_coin_emitted)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_coin_emitted(amount: int) -> void:
	for i in amount:
		var coin = Coin.instantiate() as RigidBody2D
		coin.position = Vector2(0, -10)
		call_deferred('add_child', coin)
		coin.call_deferred("apply_central_force", Vector2(0, 100000000))