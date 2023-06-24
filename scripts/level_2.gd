extends Node2D


var POSITION_FROM_WORLD = Vector2(-160,234)


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.LAST_SCENE == Global.SCENE_LEVEL_2:
		# TODO exception
		print("last scene == current scene!!!!! ->", Global.CURRENT_SCENE)
	elif Global.LAST_SCENE == Global.SCENE_WORLD:
		$player.position = POSITION_FROM_WORLD


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_portal_01_body_entered(body):
	if body.has_method("player"):
		print("player enter portal_1")
		# Global.TRANSITION_SCENE = true
		Global.change_scene(Global.SCENE_WORLD)


func _on_portal_01_body_exited(body):
	pass # Replace with function body.
