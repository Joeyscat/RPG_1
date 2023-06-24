extends CharacterBody2D

var SPEED = 25
var PLAYER_CHASE = false
var PLAYER = null

var HEALTH = 100
var PLAYGER_INATTACK_ZONE = false


func _physics_process(delta):
	handle_damage()

	if PLAYER_CHASE:
		var target = PLAYER.position
		position = position.move_toward(target, SPEED * delta)
		
		if position.x > PLAYER.position.x:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
		
	else:
		$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body):
	PLAYER = body
	PLAYER_CHASE = true


func _on_detection_area_body_exited(body):
	PLAYER = null
	PLAYER_CHASE = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		PLAYGER_INATTACK_ZONE = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		PLAYGER_INATTACK_ZONE = false

func handle_damage():
	if PLAYGER_INATTACK_ZONE and Global.PLAYER_CURRENT_ATTACK:
		HEALTH = HEALTH - 20
		print("slime health = ", HEALTH)
		if HEALTH <= 0:
			self.queue_free()
