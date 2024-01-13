extends Node
class_name CharacterData

@export var MaxHealth := 5
@export var Health = 1
@export var Instrumentlevel := 1
@export var WeaponLevel := 1
@export var pos : Vector2

func startHealthUpdate():
	Health = MaxHealth

func takeDamage(damage):
	Health -= damage
