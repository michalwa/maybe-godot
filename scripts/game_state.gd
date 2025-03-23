extends Node

signal score_changed(new_score: int)

@export var score: int = 0:
	get:
		return _score
	set(value):
		_score = value
		score_changed.emit(_score)

var _score: int
