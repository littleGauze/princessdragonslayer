extends Area2D

var timer: Timer = Timer.new()

func _ready():
	add_child(timer)
	timer.set_wait_time(.6)
	timer.connect("timeout", _on_timer_timeout)

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_body_entered(body: CharacterBody2D) -> void:
	if body._is_dead:
		return
	Engine.time_scale = 0.5
	body.dead()
	timer.start()
