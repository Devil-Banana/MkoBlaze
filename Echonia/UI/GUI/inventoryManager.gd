extends Control

var isOpen = false
@onready var rsc_switch: Button = $Inventory/Inventory/Resources/ItemSwitch
@onready var equip_switch: Button = $Inventory/Inventory/Equip/ItemSwitch

func _input(event):
	if event.is_action_pressed("inv"):
		isOpen = !isOpen
		$Inventory.visible = isOpen
		if isOpen:
			$UX.visible = false
		else:
			$UX.visible = true

func _ready() -> void:
	rsc_switch.pressed.connect(func show_rsc():
		$Inventory/Inventory/Panel/Resource.visible = true
		$Inventory/Inventory/Panel/Equip.visible = false
		)
	
	equip_switch.pressed.connect(func show_eqp():
		$Inventory/Inventory/Panel/Resource.visible = false
		$Inventory/Inventory/Panel/Equip.visible = true
		)
