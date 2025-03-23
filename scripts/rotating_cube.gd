class_name RotatingCube
extends Node3D

@export var label: String


func _ready() -> void:
	%InteractionReceiver.label = label
