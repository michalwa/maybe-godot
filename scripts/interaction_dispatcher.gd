class_name InteractionDispatcher
extends Node

signal receiver_changed(receiver: InteractionReceiver)

@export_flags_3d_physics var interaction_raycast_collision_mask: int
@export var interaction_max_distance: float

var _receiver: Node


func _process(_delta: float) -> void:
	var receiver := get_receiver_under_cursor()
	if receiver != _receiver:
		_receiver = receiver
		receiver_changed.emit(receiver)

	if receiver == null:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if _receiver:
			_receiver.interact()


func get_receiver_under_cursor() -> InteractionReceiver:
	var camera := get_viewport().get_camera_3d()
	var mouse_position := get_viewport().get_mouse_position()
	var ray_from := camera.project_ray_origin(mouse_position)
	var ray_to := ray_from + camera.project_ray_normal(mouse_position) * interaction_max_distance

	var ray := PhysicsRayQueryParameters3D.create(
		ray_from, ray_to, interaction_raycast_collision_mask
	)
	var hit := camera.get_world_3d().direct_space_state.intersect_ray(ray)

	if hit.has("collider"):
		return (hit["collider"] as Node).find_children("*", "InteractionReceiver", false)[0]

	return null
