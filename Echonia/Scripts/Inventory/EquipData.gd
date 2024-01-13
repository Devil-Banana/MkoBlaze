extends Resource
class_name Equip_item

enum type {
	Weapon,
	PickAxe,
	Shoot,
}

@export var equip_type :type
@export var equip : String
@export_range(2.0,20.0) var damage_strenght := 2.0
@export var sprite :Texture
@export_range(1.0,2.5) var attack_speed := 1.0
@export var earned = false

