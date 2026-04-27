extends Node

var is_moving: bool = false
var tab_moving: int = -1

var APP_NAMES = get_app_names()

func get_app_names():
	var dir = DirAccess.open("res://Scenes/Apps")
	var scenes = []
	if dir == null:
		return scenes
	
	dir.list_dir_begin()
	var scene_name = dir.get_next()
	
	while scene_name != "":
		if scene_name != "." and scene_name != "..":
			scenes.append(scene_name)
		
		scene_name = dir.get_next()
	print(scenes)
	return scenes
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
