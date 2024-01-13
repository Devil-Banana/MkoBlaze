extends Button
class_name Rsc_show

@export var rsc := Item_Resource.new()

var save_file_path = DirAccess.open("user://save")
var save_path = "user://save/game" + str(G.saveSlot) + "/items/"
var save_file_name = "Item.save"

func _process(delta: float):
	text = rsc.resource +": " + str(rsc.count)
	icon = rsc.sprite

func _ready():
	save_file_path.make_dir("game" + str(G.saveSlot))
	save_file_path.open("game" + str(G.saveSlot))
	save_file_path.make_dir("items")
	save_path = save_file_path
	DirAccess.make_dir_absolute("user://save/game" + str(G.saveSlot) + "/items")
	save_file_name = rsc.resource + "Item.tres"
	pass
	
func save_rsc():
	#save_file_path = "user://" + rsc.resource +".tres"
	ResourceSaver.save(rsc,"user://save/game" + str(G.saveSlot) + "/items/" + save_file_name)

func load_rsc():
	rsc = ResourceLoader.load("user://save/game" + str(G.saveSlot) + "/items/" + save_file_name)
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		save_rsc()
	elif  event.is_action_pressed('load'):
		load_rsc()
		pass
