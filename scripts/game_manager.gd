extends Node

var _score := 0

func _ready() -> void:
	SignalBus.bus.connect(add_score)
	_score = 0


func add_score(type: SignalBus.SignalType, payload: Dictionary):
	if (type == SignalBus.SignalType.ADD_SCORE):
		_score += payload.score
		$ScoreLabel.text = "You got " + str(_score) + " points!"
