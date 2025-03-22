extends RichTextLabel


func _ready() -> void:
	set_score(0)

	var game_state: GameState = get_tree().current_scene.find_children("*", "GameState")[0]
	game_state.score_changed.connect(set_score)


func set_score(score: int) -> void:
	text = "[b]Score:[/b] %s" % score
