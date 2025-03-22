extends Camera3D

@export_flags_3d_physics var interaction_raycast_collision_mask: int
@export var interaction_max_distance: float


func _process(_delta: float) -> void:
	if get_collider_under_cursor() == null:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		var collider := get_collider_under_cursor()
		if collider:
			for node in collider.find_children("*", "InteractionReceiver"):
				var receiver: InteractionReceiver = node
				receiver.interact()


func get_collider_under_cursor() -> Node:
	var mouse_position := get_viewport().get_mouse_position()
	var ray_from := project_ray_origin(mouse_position)
	var ray_to := ray_from + project_ray_normal(mouse_position) * interaction_max_distance

	var ray := PhysicsRayQueryParameters3D.create(
		ray_from, ray_to, interaction_raycast_collision_mask
	)
	var hit := get_world_3d().direct_space_state.intersect_ray(ray)

	if hit.has("collider"):
		return hit["collider"]

	return null
