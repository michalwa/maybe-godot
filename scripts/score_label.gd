extends RichTextLabel


func _ready() -> void:
	set_score(0)
	GameState.score_changed.connect(set_score)


func set_score(score: int) -> void:
	text = "[b]Score:[/b] %s" % score
