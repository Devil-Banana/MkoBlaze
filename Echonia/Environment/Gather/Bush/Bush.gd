extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	var A = randi_range(0,5)
#	if A == 2 or A == 5:
#			Bag.res["Coin"] += 3
#	print(Bag.res["Coin"])
	queue_free()
	pass # Replace with function body.
