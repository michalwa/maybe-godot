extends Node3D

@export var rotation_delta: Vector3

func _process(delta: float) -> void:
    rotate_x(rotation_delta.x * delta)
    rotate_y(rotation_delta.y * delta)
    rotate_z(rotation_delta.z * delta)
