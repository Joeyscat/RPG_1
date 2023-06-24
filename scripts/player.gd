extends CharacterBody2D


const SPEED = 100.0
var CURRENT_DIRECTION = DIR_RIGHT

var ENEMY_INATTACK_RANGE = false
var ENEMY_ATTACK_COOLDOWN = true
var HEALTH = 100
var PLAYGER_ALIVE = true

# direction enum
enum {
	DIR_RIGHT,
	DIR_LEFT,
	DIR_UP,
	DIR_DOWN
}

# action enum
enum {
	ACT_IDLE,
	ACT_WALK,
	ACT_RUN,
	ACT_JUMP,
	ACT_FALL,
	ACT_ATTACK,
}

func _ready():
	CURRENT_DIRECTION = DIR_DOWN


func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	current_camera()
	
	if HEALTH <= 0:
		PLAYGER_ALIVE = false
		HEALTH = 0
		print("player has been killed")
		self.queue_free()



func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		CURRENT_DIRECTION = DIR_RIGHT
		player_animation(ACT_WALK)
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		CURRENT_DIRECTION = DIR_LEFT
		player_animation(ACT_WALK)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		CURRENT_DIRECTION = DIR_DOWN
		player_animation(ACT_WALK)
		velocity.x = 0
		velocity.y = SPEED
	elif  Input.is_action_pressed("ui_up"):
		CURRENT_DIRECTION = DIR_UP
		player_animation(ACT_WALK)
		velocity.x = 0
		velocity.y = -SPEED
	elif Input.is_action_pressed("attack"):
		player_animation(ACT_ATTACK)
		velocity.x = 0
		velocity.y = 0
	else:
		player_animation(ACT_IDLE)
		velocity.x = 0
		velocity.y = 0

	move_and_slide()
	
func player_animation(action):
	var dir = CURRENT_DIRECTION
	var anim = $AnimatedSprite2D

	if dir == DIR_RIGHT:
		anim.flip_h = false
		if action == ACT_IDLE:
			anim.play("side_idle")
		elif action == ACT_WALK:
			anim.play("side_walk")
		elif action == ACT_ATTACK:
			anim.play("side_attack")
	elif dir == DIR_LEFT:
		anim.flip_h = true
		if action == ACT_IDLE:
			anim.play("side_idle")
		elif action == ACT_WALK:
			anim.play("side_walk")
		elif action == ACT_ATTACK:
			anim.play("side_attack")
			
	elif dir == DIR_UP:
		anim.flip_h = false
		if action == ACT_IDLE:
			anim.play("back_idle")
		elif action == ACT_WALK:
			anim.play("back_walk")
		elif action == ACT_ATTACK:
			anim.play("back_attack")
	elif dir == DIR_DOWN:
		anim.flip_h = false
		if action == ACT_IDLE:
			anim.play("front_idle")
		elif action == ACT_WALK:
			anim.play("front_walk")
		elif action == ACT_ATTACK:
			anim.play("front_attack")
	else:
		pass
	
func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		ENEMY_INATTACK_RANGE = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		ENEMY_INATTACK_RANGE = false


func enemy_attack():
	if ENEMY_INATTACK_RANGE and ENEMY_ATTACK_COOLDOWN:
		HEALTH = HEALTH-20
		ENEMY_ATTACK_COOLDOWN = false
		$slime_attack_cooldown.start()
		print(HEALTH)


func player_attack():
	pass


func _on_slime_attack_cooldown_timeout():
	$slime_attack_cooldown.stop()
	ENEMY_ATTACK_COOLDOWN = true
	
	
func current_camera():
	if Global.CURRENT_SCENE == "world":
		$camera_world.enabled = true
		$camera_level_2.enabled = false
	elif Global.CURRENT_SCENE == "level_2":
		$camera_world.enabled = false
		$camera_level_2.enabled = true



