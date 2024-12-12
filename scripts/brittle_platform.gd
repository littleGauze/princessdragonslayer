extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_2d_body_entered(_body:Node2D) -> void:
	$AnimatedSprite2D.play('start')


func _on_animated_sprite_2d_animation_finished() -> void:
	print("animation finished")
	$Timer.start()
	$CollisionShape2D.disabled = true

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play('idle')
	$CollisionShape2D.disabled = false
