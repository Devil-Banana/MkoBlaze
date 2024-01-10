extends Gather_Resource


var player_in_zone = false

func damage(strenght : float):
	#if player_in_zone:
	damageEffect($Sprite2D)
	current_health -= strenght
	$StoneAudio.play()
	
	if current_health <= 0:
		drop()
		queue_free()


func _on_mouse_zone_area_entered(area: Area2D) -> void:
	player_in_zone = true
	pass # Replace with function body.


func _on_mouse_zone_area_exited(area: Area2D) -> void:
	player_in_zone = false
	pass # Replace with function body.
