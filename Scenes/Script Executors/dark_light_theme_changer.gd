extends Node

@export var darkTheme: Theme
@export var lightTheme: Theme


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var parent = get_parent()
	if GlobalSettings.dark_mode:
		parent.theme = darkTheme
	else:
		parent.theme = lightTheme
