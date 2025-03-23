extends RichTextLabel


func _ready() -> void:
	text = ""
	(owner as Hud).inventory.item_added.connect(add_item)


func _process(_delta: float) -> void:
	scale = lerp(scale, Vector2(1.0, 1.0), 0.1)


func add_item(_item: String) -> void:
	scale *= 1.2
	text = "[b]Inventory:[/b] %s" % ", ".join((owner as Hud).inventory.get_items())
