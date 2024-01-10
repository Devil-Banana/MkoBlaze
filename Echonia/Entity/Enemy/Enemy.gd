extends CharacterBody2D
class_name ennemy

@export var health = 10000
@export var speed = 100.0


func damage_effect():
	var tween = create_tween()
	await tween.tween_property($Skin, 'modulate', Color.DARK_RED,0.2)
	tween.tween_property($Skin, 'modulate', Color.WHITE,0.1)
