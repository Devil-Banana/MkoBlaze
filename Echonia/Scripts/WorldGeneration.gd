extends Node2D
class_name World_generator

@export var objects_to_spawn : Array[PackedScene]
@export var min_objects : int = 5
@export var max_objects : int = 15
@export var spawn_area_size := Vector2(10, 10)
@export var spawn_color := Color.WHITE

func spawn_objects():
	# Определение случайного количества объектов
	var number_of_objects : int = randi() % (max_objects - min_objects + 1) + min_objects
	for i in range(number_of_objects):
		# Генерация случайных координат в пределах spawn_area_size
		var random_x : float = randf_range(-spawn_area_size.x,spawn_area_size.x)
		var random_y : float = randf_range(-spawn_area_size.y, spawn_area_size.y)
	
		# Создание объекта на случайных координатах
		var spawn_position := Vector2(random_x, random_y)

		# Выбор случайного префаба из массива
		var object_prefab = objects_to_spawn[randi()% objects_to_spawn.size()]

		# Инстанциируем объект
		var spawn_prefab = object_prefab
		var new_spawn =spawn_prefab.instantiate();
		new_spawn.position = spawn_position
		new_spawn.modulate = spawn_color
		add_child(new_spawn)

func _ready():
	spawn_objects()
