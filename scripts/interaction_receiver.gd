class_name InteractionReceiver
extends Node

signal interacted(actor: Node)

@export var label: String


func interact(actor: Node) -> void:
	interacted.emit(actor)
