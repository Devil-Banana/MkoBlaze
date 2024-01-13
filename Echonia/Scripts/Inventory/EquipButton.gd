extends Button
class_name Equip_button

@export var eqp :Equip_item

func _ready() -> void:
	visible = eqp.earned
	icon = eqp.sprite
	
	pressed.connect(func equip():
		text = "equiped"
		Equip.damage_strenght = eqp .damage_strenght

		Equip.wep_sprite = eqp.sprite

		)
