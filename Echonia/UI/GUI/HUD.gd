extends Control

@onready var stat = %Stat

func _process(delta: float) -> void:
	$HealthBuuble/ProgressBar.value = stat.Health
	$HealthBuuble/ProgressBar.max_value = stat.MaxHealth
	$HealthBuuble/Label.text = str(stat.Health) + "%"
	pass
