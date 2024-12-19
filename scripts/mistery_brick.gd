extends StaticBody2D

@export var amount: int = 1

func _on_area_2d_body_entered(_body:Node2D) -> void:
	hit()
	$AudioStreamPlayer2D.play()
	$Sprite2D.visible = true

func hit():
	var up: Tween = get_tree().create_tween()
	up.tween_property(self, 'position', Vector2(position.x, position.y - 2), .1)
	up.set_trans(Tween.TRANS_CUBIC)
	up.set_ease(Tween.EASE_OUT)
	var down: Tween = up.chain()
	down.tween_property(self, 'position', Vector2(position.x, position.y), .1)
	down.set_trans(Tween.TRANS_CUBIC)
	down.set_ease(Tween.EASE_OUT)

	$CoinEmiter.coin_emitted.emit(amount)
