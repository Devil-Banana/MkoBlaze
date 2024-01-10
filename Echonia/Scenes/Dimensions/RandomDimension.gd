extends Node2D

@onready var world = $TileMap
@onready var generator = $World_generator
@export var generation_color :Color
@export var color := Color.WHITE


func _ready() -> void:
		var random_color = Color(randf(),randf(),randf())
		color = random_color
		world.modulate = color
		var random_generation_color = Color(randf(),randf(),randf())
		generator.modulate = random_generation_color

