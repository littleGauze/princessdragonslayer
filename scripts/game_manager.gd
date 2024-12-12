extends Node

var _score := 0

func _ready() -> void:
	_score = 0


func add_score(score: int):
	_score += score
	$ScoreLabel.text = "You got " + str(_score) + " points!"
