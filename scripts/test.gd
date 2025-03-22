extends Node


func test() -> void:
	var scale := randf_range(0.5, 1.5)
	get_parent().scale = Vector3(scale, scale, scale)

	var game_state: GameState = get_tree().current_scene.find_children("*", "GameState")[0]
	game_state.score += 1
