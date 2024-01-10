extends Control

const EKZOTIKA ="res://Scenes/Planets/Ekzotika.tscn"
const EXPLORIA = "res://Scenes/Planets/Exploria.tscn"
const VULKANIKA =" res://Scenes/Planets/Vulkanika.tscn"

func _on_exploria_pressed():
	get_tree().change_scene_to_file(EXPLORIA)
	pass # Replace with function body.


func _on_vulkanie_pressed():
	get_tree().change_scene_to_file(VULKANIKA)
	pass # Replace with function body.


func _on_ekzotika_pressed():
	get_tree().change_scene_to_file(EKZOTIKA)
	pass # Replace with function body.
