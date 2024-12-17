extends RigidBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Coin entered area ", body.name)
	%GameManager.add_score(1)
	$AnimationPlayer.play('pickup')
