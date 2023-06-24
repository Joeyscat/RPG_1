extends Node

var PLAYER_CURRENT_ATTACK = false

var SCENE_INVALID ="invalid"
var SCENE_WORLD ="world"
var SCENE_LEVEL_2 ="level_2"

var TRANSITION_SCENE = false
var LAST_SCENE = SCENE_INVALID
var CURRENT_SCENE = SCENE_WORLD

var PLAYER_EXIT_CLIFFSIDE_POSX = 0
var PLAYER_EXIT_CLIFFSIDE_POSY = 0
var PLAYER_START_POSX = 0
var PLAYER_START_POSY = 0


func change_scene(scene):
	print("changing scene: ", Global.CURRENT_SCENE, " to ", scene)
	# if Global.TRANSITION_SCENE:
		# Global.CURRENT_SCENE
	Global.LAST_SCENE = Global.CURRENT_SCENE
	Global.CURRENT_SCENE = scene
	scene_file_path = "res://scenes/" + scene + ".tscn"
	get_tree().change_scene_to_file(scene_file_path)
