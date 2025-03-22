class_name InteractionReceiver
extends Node

signal interacted


func interact() -> void:
	interacted.emit()
