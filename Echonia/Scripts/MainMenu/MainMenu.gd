extends Control


@onready var newGame = $BG/NewGame
@onready var con = $BG/ContinueGame

func _ready():
	$Solar/AnimationPlayer.play("Solar")
	var anim = $CanvasLayer/CanvasModulate/AnimationPlayer as AnimationPlayer
	anim.play("FadeOFF")
	
func _on_new_game_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property(newGame, "scale", Vector2(0.6,0.6),0.1)
	pass # Replace with function body.


func _on_new_game_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property(newGame, "scale", Vector2(0.5,0.5),0.1)
	pass # Replace with function body.


func _on_new_game_pressed() -> void:
	$CanvasLayer/CanvasModulate/AnimationPlayer.play('FadeON')
	var tween = create_tween()
	tween.tween_property(newGame, "scale", Vector2(0.3,0.3),0.1)
	pass # Replace with function body.


func NewGame():
	get_tree().change_scene_to_file("res://Scenes/Planets/Exploria.tscn")
