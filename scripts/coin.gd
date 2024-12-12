extends Area2D

func _on_body_entered(_body: Node2D):
	%GameManager.add_score(1)
	$AnimationPlayer.play('pickup')
