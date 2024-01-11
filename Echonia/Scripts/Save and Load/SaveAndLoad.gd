extends Timer
class_name save_and_load

@export_group("Player Save")
@export var saveData = SaveData
var save_file_path = "user://save/"
var save_file_name = "WorldSave"+ str(G.saveSlot) +".tres"

func _ready() -> void:
	verify_save_dict(save_file_path)
	pass
	

func verify_save_dict(path: String):
	DirAccess.make_dir_absolute(path)

func load_data():
	saveData = ResourceLoader.load(save_file_path+save_file_name).duplicate(true)
	get_tree().call_group("Player","on_start_load")
	saveData.load_resource_data()
	print("loaded")
	

func save():
	saveData.save_resource_data()
	get_tree().call_group("Player","save_pos")
	ResourceSaver.save(saveData,save_file_path+save_file_name)

	print("save")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		save()
	elif  event.is_action_pressed('load'):
		load_data()
