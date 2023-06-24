extends Node2D


var POSITION_FROM_LEVEL_2 = Vector2(-10,-136)


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.LAST_SCENE == Global.SCENE_WORLD:
		# TODO exception
		print("last scene == current scene!!!!! ->", Global.CURRENT_SCENE)
	elif Global.LAST_SCENE == Global.SCENE_LEVEL_2:
		$player.position = POSITION_FROM_LEVEL_2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_portal_1_body_entered(body):
	if body.has_method("player"):
		print("player enter portal_1")
		# Global.TRANSITION_SCENE = true
		Global.change_scene(Global.SCENE_LEVEL_2)
		


func _on_portal_1_body_exited(body):
	if body.has_method("player"):
		pass
		# Global.TRANSITION_SCENE = false


