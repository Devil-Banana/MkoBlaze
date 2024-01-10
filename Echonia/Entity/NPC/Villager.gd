extends CharacterBody2D

@export var speed := 100.0
@onready var anim = $AnimationPlayer
@onready var label =  $Label

var dir = Vector2.RIGHT
var start_pos

var current_state = IDLE

var is_roaming = true
var is_chatting = false

var player
var player_in_chat_zone = false

enum {
	IDLE,
	NEW_DIR,
	MOVE
}


func _ready() -> void:
	randomize()
	start_pos = position
	


func _process(delta: float) -> void:
	
	if current_state == 0 or current_state == 1:
		anim.play('Idle')
	elif current_state == 2 and !is_chatting:
		anim.play('Walk')
		
	
	if is_roaming:
		match current_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT,Vector2.UP,Vector2.LEFT,Vector2.DOWN])
			MOVE:
				move(delta)
				if dir.x < 0:
					$Skin.scale = Vector2(-1 , 1)
				if  dir.x > 0 :
					$Skin.scale = Vector2(1 , 1)
		if Input.is_action_just_pressed('Interact') and player_in_chat_zone:
			print("Dialogue Starts")
			$Dialogue.start()
			is_roaming = false
			is_chatting = true
			anim.play("Idle")
			
		
	


func choose(array):
	array.shuffle()
	return array.front()
	

func move(delta):
	if !is_chatting:
		position += dir * speed * delta

func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([0.5,1,1.5])
	current_state = choose([IDLE, NEW_DIR, MOVE])



func _on_chat_detect_body_entered(body: Node2D) -> void:
		player = body
		label.visible = true
		player_in_chat_zone = true


func _on_chat_detect_body_exited(body: Node2D) -> void:
		player = body
		label.visible = false
		player_in_chat_zone = false


func _on_dialogue_dialogue_finished() -> void:
	is_chatting = false
	is_roaming = true
	pass # Replace with function body.
