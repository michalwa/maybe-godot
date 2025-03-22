class_name InteractionReceiver
extends Node

signal interacted

@export var label: String


func interact() -> void:
	interacted.emit()
