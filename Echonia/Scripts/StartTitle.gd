extends Node2D


func _ready() -> void:
	$CanvasLayer/AnimationPlayer.play("Title")

func Finish_Title():
	get_tree().change_scene_to_file('res://Scenes/Game/StartVillage.tscn')
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_accept'):
		$CanvasLayer/AnimationPlayer.speed_scale = 1
	else:
		$CanvasLayer/AnimationPlayer.speed_scale = 0.1
