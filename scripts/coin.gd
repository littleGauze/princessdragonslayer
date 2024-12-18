extends Area2D

func _on_body_entered(_body: Node2D):
	SignalBus.bus.emit(SignalBus.SignalType.ADD_SCORE, { score = 1 })
	$AnimationPlayer.play('pickup')
