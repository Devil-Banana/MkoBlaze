extends Gather_Resource

var destroyed := false
@onready var hit = $Mouse_Zone
@onready var farm = $Timer as Timer

@export var hide_color := Color.WHITE

const CHOP_0 = preload('res://Sound/Tree/Chop0.wav')
const CHOP_1 = preload('res://Sound/Tree/Chop1.wav')
const CHOP_2 = preload('res://Sound/Tree/Chop2.wav')
const CHOP_3 = preload('res://Sound/Tree/Chop3.wav')
const CHOP_4 = preload('res://Sound/Tree/Chop4.wav')

func choose(array):
	array.shuffle()
	return array.front()
	

var player_zone = false
var player

func damage(strenght : float):
	var aud = choose([CHOP_0,CHOP_1,CHOP_2,CHOP_2,CHOP_3,CHOP_4])
	
	if player_zone:
		print("Attacked " + name)
		damageEffect($Sprite2D)
		current_health -= strenght
		$TreeAudio.stream = aud
		$TreeAudio.play()
	
	if current_health <= 0 and !destroyed:
		drop()
		destroyed = true
		$Sprite2D.hide()
		farm.start(20)
		#$HurtBox/CollisionShape2D.disabled = true

func _on_timer_timeout() -> void:
	current_health = health
	current_health * Lvl
	destroyed = false
	$Sprite2D.show()
	pass # Replace with function body.

func _on_mouse_zone_area_entered(area: Area2D) -> void:
	player = area.get_parent()
	player_zone = true
	pass # Replace with function body.


func _on_mouse_zone_area_exited(area: Area2D) -> void:
	player = area.get_parent()
	player_zone = false
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if player != null:
		if position.y < player.position.y:
			modulate = hide_color
		else:
			modulate = Color.WHITE
