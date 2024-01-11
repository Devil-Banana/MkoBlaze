extends Resource
class_name SaveData


@export var ResourceData :Array[Item_Resource]
#@export var WeaponsData :
@export var playerData : CharacterData

func save_resource_data():
	for i in ResourceData.size():
		ResourceData[i].save_last_count()
func load_resource_data():
	for i in ResourceData.size():
		ResourceData[i].load_last_count()
