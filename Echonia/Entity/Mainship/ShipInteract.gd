extends Sprite2D

var active = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	active = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	active = false
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if active:
		if event.is_action_pressed('Interact'):
			pass
