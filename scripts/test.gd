extends Node


func test(actor: Node) -> void:
	var scale := randf_range(0.5, 1.5)
	get_parent().scale = Vector3(scale, scale, scale)

	GameState.score += 1

	for inventory in actor.find_children("*", "Inventory"):
		(inventory as Inventory).add_item((owner as RotatingCube).label)
