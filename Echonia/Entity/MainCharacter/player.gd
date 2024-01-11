extends CharacterBody2D

@export var SPEED = 300.0
@export var playerData = CharacterData.new()

@onready var anim = $AnimationPlayer
@onready var equip = $HUD/CanvasLayer/Handle
@onready var hit_box = $Skin/HitBox
enum  {Idle,Walk,Damage,Attack}
var state = Idle
var can_move = true

func on_start_load():
	print("A")
	position = playerData.pos

func _physics_process(delta):
	
	var dirX = Input.get_axis("ui_left", "ui_right")
	var dirY = Input.get_axis("ui_up", "ui_down")
	
	if !can_move:
		dirX = 0
		dirY = 0
	if Input.is_action_pressed("Dash"):
		velocity.x = dirX * SPEED * 2.2
		velocity.y = dirY * SPEED * 2.2
		if dirX != 0 or dirY != 0:
			anim.speed_scale = 2.2
		else:
			anim.speed_scale = 1.7
	else :
		velocity.x = dirX * SPEED
		velocity.y = dirY * SPEED
		anim.speed_scale = 1.7


	match state:
		Idle:
			
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				state = Attack
			elif dirX != 0 or dirY != 0:
				state = Walk
			else :
				anim.play("Idle")
		Walk:
			if dirX != 0 or dirY != 0:
				anim.play("Walk")
				move_and_slide()
			else :
				state = Idle

			if (dirX < 0):
				$Skin.scale = Vector2(-1 , 1)
			elif (dirX > 0):
				$Skin.scale = Vector2(1 , 1)
		Damage:
			anim.play('Damage')
			
		Attack:
			anim.play('Attack')

func damage(strenght):
	state = Damage
	playerData.takeDamage(strenght)
	var tween = create_tween()
	await tween.tween_property($Skin, 'modulate', Color.DARK_RED,0.2)
	tween.tween_property($Skin, 'modulate', Color.WHITE,0.1)

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed('Switch_Wep'):
		if Equip.wep == "Gather":
			Equip.wep = "Wep"
			$Skin/Body/LeftHand/Tool/Pivot/Texture.texture = Equip.sword
			equip.icon = Equip.sword
			hit_box.set_collision_mask_value(6,false)
			hit_box.set_collision_mask_value(5,true)
		elif Equip.wep == "Wep":
			Equip.wep = "Gather"
			$Skin/Body/LeftHand/Tool/Pivot/Texture.texture = Equip.axe
			equip.icon = Equip.axe
			hit_box.set_collision_mask_value(6,true)
			hit_box.set_collision_mask_value(5,false)

func attack_finish():
	state = Idle

func _on_hit_box_area_entered(area: Area2D) -> void:
	if Equip.wep == "Wep":
		area.get_parent().damage(Equip.damage_strenght)
	elif Equip.wep == "Gather":
		area.get_parent().damage(Equip.gather_strenght)
	pass # Replace with function body.

func save_pos():
	playerData.pos = position
