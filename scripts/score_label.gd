extends RichTextLabel


func _process(_delta: float) -> void:
	text = "[b]Score:[/b] %s" % (owner as Hud).game_state.score
