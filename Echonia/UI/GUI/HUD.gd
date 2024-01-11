extends Control

var CharData = SL.saveData.playerData as CharacterData

func _ready() -> void:
	CharData.startHealthUpdate()
	
func _process(delta: float) -> void:
	$HealthBuuble/ProgressBar.value = CharData.Health
	$HealthBuuble/ProgressBar.max_value = CharData.MaxHealth
	$HealthBuuble/Label.text = str(CharData.Health) + "%"
	pass
