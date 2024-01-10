extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("FadeOFF")


func FadeOFF():
	animation_player.play("FadeON")
