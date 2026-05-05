extends ColorRect

signal ready_to_make

@export var window_name: String

var window_x: int
var window_y: int
var has_close_button: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window_name = get_parent().APP_ID
	build_app(window_name)


func has_child_named(name: String) -> bool:
	for child in get_children():
		if child.name == name:
			return true
	return false

func build_app(id: String):
	if !(GlobalTab.APP_NAMES.has(id)):
		id = "Error"
	hide_children(id)
	
	match id:
		"Settings":
			window_x = 900
			window_y = 500
			has_close_button = true
		"Quickloans - Account Manager":
			window_x = 800
			window_y = 460
			has_close_button = true
		"Quickloans - Loan Front":
			window_x = 1000
			window_y = 600
			has_close_button = true
		_:
			window_x = 500
			window_y = 300
			has_close_button = false
	get_parent().make_tab()

func hide_children(keep):
	for child in get_children():
		child.visible = (child.name == keep)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
