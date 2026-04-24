extends ColorRect

@export var SETTINGS_SCENE: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func build_app(id):
	var scene: PackedScene
	if load("res://Scenes/Apps/"+GlobalTab.APP_NAMES[id]+".tscn"):
		scene = load("res://Scenes/Apps/"+GlobalTab.APP_NAMES[id]+".tscn")
	else:
		scene
	#match id:
	#	1:
	#		new = SETTINGS_SCENE.instantiate()
		
	#add_child(new)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
