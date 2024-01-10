extends Node2D

var player_in_zone := false
@export var wood = Item_Resource
@export var stone = Item_Resource

@export var wood_cnt := 20
@export var stone_cnt := 10
@export var BuildColor :Color

@export var coins : Item_Resource

var player
var is_build = false

func _input(event: InputEvent) -> void:
	if  event.is_action_pressed('Interact') and player_in_zone and !is_build:
		if wood.count >= wood_cnt and stone.count >= stone_cnt:
			Build()
		
	elif event.is_action_pressed('Interact') and player_in_zone and is_build:
		$Control/CanvasLayer.show()
		player.can_move = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in_zone = true
	$ShowRsc.show()
	player = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in_zone = false
	$ShowRsc.hide()
	
	player = null
	pass # Replace with function body.


func Build():
	print("Build Worked")
	wood.count -= wood_cnt
	stone.count -= stone_cnt
	is_build = true
	$Build/Sprite.self_modulate = BuildColor
	$ShowRsc/Label.text = "[E] 
	Գնում"
	$Builded/Character/AnimationPlayer.play("Character")
	$Builded.show()
	
	pass


func _on_button_pressed() -> void:
	player.can_move = true
	$Control/CanvasLayer.hide()
