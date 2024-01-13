extends Resource
class_name Item_Resource

@export var sprite :Texture2D
@export var resource : String
@export var count := 0
@export var last_count = 0
var save_path = "user://saves/world/item/" + resource +".tres"

func save_last_count():
	last_count = count

func load_last_count():
	count = last_count


