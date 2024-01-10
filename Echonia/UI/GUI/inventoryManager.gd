extends Control

var isOpen := false

func _input(event):
	if event.is_action_pressed("inv"):
		isOpen = !isOpen
		$CanvasLayer/Inventory.visible = isOpen
