extends Node3D

@export var speed: float = 7.0
@export var acceleration: float = 50.0
@export var rotation_speed: float = 0.01

var _velocity: Vector3 = Vector3.ZERO


func _physics_process(delta: float) -> void:
	var direction := (
		Vector3(
			Input.get_axis("move_left", "move_right"),
			Input.get_axis("move_down", "move_up"),
			Input.get_axis("move_forward", "move_back"),
		)
		. normalized()
	)

	if direction.length_squared() > 0:
		_velocity += direction * acceleration * delta
	else:
		var new_velocity := _velocity - _velocity.normalized() * acceleration * delta
		if _velocity.dot(new_velocity) < 0:
			_velocity = Vector3.ZERO
		else:
			_velocity = new_velocity

	if _velocity.length() > speed:
		_velocity = _velocity.normalized() * speed

	translate_object_local(_velocity * delta)

	global_rotate(Vector3.UP, Input.get_axis("pan_right", "pan_left") * rotation_speed)
	global_rotate(basis.x, Input.get_axis("pan_down", "pan_up") * rotation_speed)
