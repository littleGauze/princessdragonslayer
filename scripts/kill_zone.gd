extends Area2D

var timer: Timer = Timer.new()

func _ready():
	add_child(timer)
	timer.set_wait_time(.6)
	timer.connect("timeout", _on_timer_timeout)

func _on_timer_timeout():
	get_tree().reload_current_scene()


func _on_body_entered(body: Node2D) -> void:
	print("body entered ", body.name)
	timer.start()
