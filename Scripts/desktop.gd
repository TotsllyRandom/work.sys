extends Control

@export var window_instance: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func num_of_windows() -> int:
	var ct = 0
	print(str(get_children()))
	for child in get_children():
		if child.is_in_group("window"):
			ct += 1
	return ct

func move_window_to_top(num: int):
	for child in get_children():
		if child.is_in_group("window"):
			if child.layer > num:
				child.layer -= 1
			elif child.layer == num:
				child.layer = num_of_windows() + 1
				move_child(child, get_child_count()-1)

#func find_focus():
#	var kiddos = []
#	for child in get_children():
#		if child.is_in_group("window"):
#			child.mouse_filter = Control.MOUSE_FILTER_PASS
#			kiddos.append(child)
#			child.mouse_filter = Control.MOUSE_FILTER_STOP
#	kiddos.sort_custom(func(a,b): return a.z_index > b.z_index)
#	
#	for kid in kiddos:
#		print("checking " + str(kid) + " at z " + str(kid.z_index))
#		kid.check()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#DEBUG new tab
	if Input.is_action_just_pressed("test_new_tab"):
		var new = window_instance.instantiate()
		new.make_tab(randi_range(1,2))
		new.position.x = randi_range(10,1152 - new.size.x - 10)
		new.position.y = randi_range(10,648 - new.size.y - 10)
		new.layer = num_of_windows() + 1
		new.ID = num_of_windows() + 1
		new.move_to_top.connect(move_window_to_top)
		add_child(new)
