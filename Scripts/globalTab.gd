extends Node

var current_tab_focused: int = -1
var last_tab_focused: int
var current_top_z: int
var next_id: int = 1
var moving_tab: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_tab_focused >= 0 and moving_tab:
		last_tab_focused = current_tab_focused
