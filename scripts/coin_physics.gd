extends RigidBody2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		SignalBus.bus.emit(SignalBus.SignalType.ADD_SCORE, { score = 1 })
		$AnimationPlayer.play('pickup')
