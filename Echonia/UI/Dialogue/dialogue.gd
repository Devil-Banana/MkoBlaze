extends Control

signal dialogue_finished

@export var d_file : Array[String]

var dialogue = []
var current_dialogue_id = 0
var d_active = false

func _ready() -> void:
	box(false)

func start():
	if d_active:
		return
	d_active = true
	box(true)
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()

func load_dialogue():
	var d_i = randi_range(0,2)
	print(str(d_i))
	var file = FileAccess.open(d_file[d_i],FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	

func _input(event: InputEvent) -> void:
	if !d_active:
		return
	if  event.is_action_pressed('ui_accept'):
		next_script()

func next_script():
	current_dialogue_id +=1
	if current_dialogue_id >= len(dialogue):
		d_active = false
		box(false)
		emit_signal("dialogue_finished")
		return
	
	$CanvasLayer/NinePatchRect/Name.text = dialogue[current_dialogue_id]['name']
	$CanvasLayer/NinePatchRect/dialog.text = dialogue[current_dialogue_id]['text']

func box(turn:bool):
	$CanvasLayer.visible = turn
