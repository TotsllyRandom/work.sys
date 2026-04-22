extends Control

@export var tab_instance: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func find_num_of_tabs() -> int:
	var ct : int = 0
	for child in get_children():
		if child.is_in_group("tab"):
			ct += 1
	return ct

func rearrange_tabs(top):
	var num_tabs = find_num_of_tabs()
	var find_z: int
	for child in get_children():
		if child.is_in_group("tab"):
			if child.id == top:
				find_z = child.z_index
	
	for child in get_children():
		if child.is_in_group("tab"):
			if child.z_index == find_z:
				child.z_index = num_tabs
			elif child.z_index > find_z:
				child.z_index -= 1

func close_tab(closeID, closeZ):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test_new_tab"):
		var new_tab = tab_instance.instantiate()
		new_tab.position.x = randi_range(0,(1142-480))
		new_tab.position.y = randi_range(0,(640-360))
		new_tab.id = find_num_of_tabs() + 1 # will produce errors
		new_tab.z_index = find_num_of_tabs() + 1
		new_tab.move_me_to_the_top.connect(rearrange_tabs)
		add_child(new_tab)
