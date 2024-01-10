extends save_and_load

@onready var stat = %Stat

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health = stat.Health
	max_health = stat.MaxHealth
	pos = $'..'.position
	pass


func _on_button_pressed() -> void:
	save_game()
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	load_game()
	pass # Replace with function body.
