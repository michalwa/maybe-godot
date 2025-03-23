class_name Inventory
extends Node

signal item_added(item: String)

var _items: Array[String] = []


func add_item(item: String) -> void:
	_items.append(item)
	item_added.emit(item)


func get_items() -> Array[String]:
	return _items.duplicate()
