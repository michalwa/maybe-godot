extends Node


func test() -> void:
	var scale := randf_range(0.5, 1.5)
	get_parent().scale = Vector3(scale, scale, scale)

	GameState.score += 1
