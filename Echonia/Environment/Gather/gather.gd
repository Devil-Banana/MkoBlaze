extends Node2D
class_name Gather_Resource

var Lvl := 1
@export var maxLvl := 3
@export var health := 5
var current_health = health
@export var resource : Item_Resource
var dropcnt
# Called when the node enters the scene tree for the first time.
func _ready():
	Lvl = randi() % 3
	scale = Vector2(Lvl,Lvl)
	current_health = health * 5
	current_health * Lvl

func damageEffect(ob):
	var tween = create_tween()
	#await tween.tween_property($Sprite2D, "scale", Vector2(0.8,0.8),0.1)
	#tween.tween_property($Sprite2D, "scale", Vector2(1,1),0.1)
	await tween.tween_property(ob, "rotation", randf_range(-0.5,0.5),0.1)
	tween.tween_property(ob, "rotation", 0,0.1)

func drop():
	var drop_cnt = randi_range(1,3 + Lvl)
	dropcnt = drop_cnt
	print(drop_cnt)
	resource.count += drop_cnt
