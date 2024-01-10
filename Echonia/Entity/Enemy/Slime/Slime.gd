extends ennemy

enum {
	IDLE,
	NEW_DIR,
	MOVE,
	DAMAGE,
	AGR,
	Death
}

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var dir = Vector2.RIGHT
var start_pos: Vector2
var current_state = IDLE
var is_roaming: bool = true
var is_agr: bool = false
var player

func _ready() -> void:
	randomize()
	start_pos = position

func _process(delta: float) -> void:
		match current_state:
			IDLE:
				animation_player.play("Idle")
				pass
			NEW_DIR:
				animation_player.play("Idle")
				dir = choose([Vector2.RIGHT,Vector2.UP,Vector2.LEFT,Vector2.DOWN])
			MOVE:
				animation_player.play("Idle")
				move(delta)
				if dir.x < 0:
					$Skin.scale = Vector2(-1 , 1)
				if  dir.x > 0 :
					$Skin.scale = Vector2(1 , 1)
			DAMAGE:
				animation_player.play("Damage")
			AGR:
				position += (player.position - position).normalized() * speed * delta
				animation_player.play("Idle")
				
				if player.position.x < position.x:
					$Skin.scale = Vector2(-1 , 1)
				if  player.position.x > position.x :
					$Skin.scale = Vector2(1 , 1)
					
				if position.distance_to(player.position) > 150:
					print(health)
					#current_state = Attack
					$AttackTimer.start()
			Death:
				$CPUParticles2D.emitting = true
				
			
		
		if(health <= 0):
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
	health -= strenght
	current_state = DAMAGE
	damage_effect()
	


	if is_agr:
		$AttackTimer.start()
	pass # Replace with function body.


func _on_hit_box_area_entered(area: Area2D) -> void:
	area.get_parent().damage()
	pass # Replace with function body.


func _on_cpu_particles_2d_finished() -> void:
	queue_free()
	pass # Replace with function body.
