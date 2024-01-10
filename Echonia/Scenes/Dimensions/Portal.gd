extends Sprite2D

var in_zone = false
@export var scene = 'res://Scenes/Dimensions/RandomDimension.tscn'

func _input(event: InputEvent) -> void:
	if in_zone and event.is_action_pressed('Interact'):
		get_tree().change_scene_to_file(scene)

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Label.visible = true
	in_zone = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	$Label.visible = false
	in_zone = false
	pass # Replace with function body.
