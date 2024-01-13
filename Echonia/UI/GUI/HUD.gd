extends Control


@onready var handle: Button = $'../Handle'


func _process(delta: float) -> void:
	##$HealthBuuble/ProgressBar.value = CharData.Health
	##$HealthBuuble/ProgressBar.max_value = CharData.MaxHealth
	##$HealthBuuble/Label.text = str(CharData.Health) + "%"
	handle.icon = Equip.wep_sprite
	
