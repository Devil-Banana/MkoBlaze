extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	if  Input.is_action_pressed("ui_up"):
		velocity = transform.x * 1 * speed
	if Input.get_axis("ui_down", "ui_up"):
		$Sprite2D/GPUParticles2D.emitting = true
	else:
		$Sprite2D/GPUParticles2D.emitting = false

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
