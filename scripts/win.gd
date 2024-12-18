extends Node2D

var area: Area2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(node: Node2D) -> void:
	$Left.restart()
	$Right.restart()
	$Left.emitting = true
	$Right.emitting = true
	$SFX.play()

func _on_area_2d_body_exited(body:Node2D) -> void:
	$Left.emitting = false
	$Right.emitting = false
