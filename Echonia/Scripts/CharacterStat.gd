extends Node
class_name Stat

@export var char_name := ""
@export var MaxHealth := 5
var Health := MaxHealth
@export var Instrumentlevel := 1
@export var WeaponLevel := 1

func _ready() -> void:
	Health = MaxHealth
