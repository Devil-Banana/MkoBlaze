extends Button
class_name Equip_level_up

var current_lvl = 0
var maxx_lvl = 0
@export var textures : Array[Texture2D]
@export var need_coins := 10
@export var coin :Item_Resource
@export var equipment :tool

enum tool{Sword,Axe}
func _ready() -> void:
	icon = textures[current_lvl]
	text = "Հզորացնել "+ str(need_coins) + " ոսկի"
	maxx_lvl = textures.size() -1
	pressed.connect(func():
		if equipment == 0:
			if current_lvl < maxx_lvl:
				if current_lvl == maxx_lvl:
					text = "MaxLVL"
					disabled = true
				else:
					$'../../../../Buy'.play()
					Equip.sword = textures[current_lvl]
					Equip.damage_strenght += 1.5
					current_lvl += 1
					need_coins = need_coins + 15 * 2
					text = "Հզորացնել "+ str(need_coins) + " ոսկի"
					icon = textures[current_lvl]
		elif equipment == 1:
			if current_lvl < maxx_lvl:
				$'../../../../Buy'.play()
				Equip.axe = textures[current_lvl]
				Equip.gather_strenght += 1.5
				current_lvl += 1
				need_coins = need_coins + 15 * 2
				text = "Հզորացնել "+ str(need_coins) + " ոսկի"
				icon = textures[current_lvl]
		)

