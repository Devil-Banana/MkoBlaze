extends ennemy

enum {
	IDLE,
	NEW_DIR,
	MOVE,
	DAMAGE,
	AGR,
	Attack,
	Death
}

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var Drop : Item_Resource
@export var Strenght := 2.0
var dir = Vector2.RIGHT
var start_pos: Vector2
var current_state = IDLE
var is_roaming: bool = true
var is_agr: bool = false
var player

const DAMAGE_0 = preload('res://Sound/Zombie/Damage0.wav')
const DAMAGE_1 = preload('res://Sound/Zombie/Damage1.wav')
const DEATH = preload('res://Sound/Zombie/Death.wav')
@onready var zombie_audio: AudioStreamPlayer2D = $ZombieAudio

func _ready() -> void:
	randomize()
	start_pos = position

func _process(delta: float):
		match current_state:
			IDLE:
				animation_player.play("Idle")
				pass
			NEW_DIR:
				animation_player.play("Idle")
				dir = choose([Vector2.RIGHT,Vector2.UP,Vector2.LEFT,Vector2.DOWN])
			MOVE:
				animation_player.play("Walk")
				move(delta)
				if dir.x < 0:
					$Skin.scale = Vector2(-1 , 1)
				if  dir.x > 0 :
					$Skin.scale = Vector2(1 , 1)
			DAMAGE:
				animation_player.play("Damage")
			AGR:
				
				if player.position.x < position.x:
					$Skin.scale = Vector2(-1 , 1)
				if  player.position.x > position.x :
					$Skin.scale = Vector2(1 , 1)
					
					
				if position.distance_to(player.position) >= 150:
					print(position.distance_to(player.position))
					position += (player.position - position).normalized() * speed * delta
					animation_player.play("Walk")
				else:
					print("Attack")
					animation_player.play("Attack")
					return

			Death:
				$Blood.emitting = true
				$Coin.emitting = true
				
			
		
		if(health <= 0):
			zombie_audio.stream = DEATH
			$Skin.hide()
			current_state = Death
			
		
	

func choose(array):
	array.shuffle()
	return array.front()
	

func move(delta):
	position += dir * speed * delta


func _on_timer_timeout() -> void: 
	if !is_agr:
		$Timer.wait_time = choose([0.5, 1, 1.5])
		current_state = choose([IDLE, NEW_DIR, MOVE])

func _on_line_of_sight_body_entered(body: Node2D) -> void:
		is_agr = true
		current_state = AGR
		player = body


func _on_line_of_sight_body_exited(body: Node2D) -> void:
		is_agr = false
		current_state = NEW_DIR

func damage_finished():
	if !is_agr:
		current_state = IDLE
	else:
		current_state = AGR
		
func attack_finished():
	if !is_agr:
		current_state = IDLE
		$AttackTimer.stop()
	else:
		current_state = AGR

func damage(strenght):
	if health <= 1:
			$CoinAudio.play()
			zombie_audio.play()
	else:
		health -= strenght
		current_state = DAMAGE
	damage_effect()
	


func _on_attack_timer_timeout() -> void:
	if is_agr:
		animation_player.play("Attack")
		$AttackTimer.start()
		current_state = Attack
	pass # Replace with function body.


func _on_hit_box_area_entered(area: Area2D) -> void:
	area.get_parent().damage(Strenght)
	pass # Replace with function body.


func _on_cpu_particles_2d_finished() -> void:
	var drp = randi() % 6
	Drop.count += drp
	queue_free()
	pass # Replace with function body.
