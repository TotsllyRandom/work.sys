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
			if child.z_index > num:
				child.z_index -= 1
			elif child.z_index == num:
				child.z_index = num_of_windows() + 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#DEBUG new tab
	if Input.is_action_just_pressed("test_new_tab"):
		var new = window_instance.instantiate()
		new.make_tab(randi_range(1,2))
		new.position.x = randi_range(10,1152 - new.size.x - 10)
		new.position.y = randi_range(10,648 - new.size.y - 10)
		new.z_index = num_of_windows() + 1
		new.name = "Window" + str(num_of_windows())
		new.move_to_top.connect(move_window_to_top)
		add_child(new)
