extends Control


func _ready() -> void:
	(owner as Hud).interaction_dispatcher.receiver_changed.connect(_on_receiver_changed)


func _process(_delta: float) -> void:
	position = get_viewport().get_mouse_position()


func _on_receiver_changed(receiver: InteractionReceiver) -> void:
	if receiver:
		$Label.text = receiver.label
	else:
		$Label.text = ""
