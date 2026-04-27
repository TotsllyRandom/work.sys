extends ColorRect

signal ready_to_make

var window_x: int
var window_y: int
var has_close_button: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	make_app_list()

func make_app_list():
	GlobalTab.APP_NAMES.clear()
	for child in get_children():
		GlobalTab.APP_NAMES.append(child.name)
	print(GlobalTab.APP_NAMES)




func build_app(id):
	if get_children().has(id):
		hide_children(id)
	else:
		hide_children("Error")
	
	match id:
		"Settings":
			window_x = 900
			window_y = 500
			has_close_button = true

func hide_children(keep):
	for child in get_children():
		if child.name != keep:
			child.visible = false
		else:
			child.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
