extends Control

@export var window_instance: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fix_bars()

func fix_bars():
	$ClockBar.size.y = GlobalSettings.clock_bar_size
	$ClockBar/Time.size.y = GlobalSettings.clock_bar_size
	if GlobalSettings.dark_mode:
		$ClockBar.color = GlobalSettings.dark_mode_background
		$DesktopImage/Brightness.color = Color(0.0, 0.0, 0.0, 0.333)
	else:
		$ClockBar.color = GlobalSettings.light_mode_background
		$DesktopImage/Brightness.color = Color(0.0, 0.0, 0.0, 0.0)
	
	

func num_of_windows() -> int:
	var ct = 0
	for child in get_children():
		if child.is_in_group("window"):
			ct += 1
	return ct

func find_current_id() -> int:
	var num = []
	for child in get_children():
		if child.is_in_group("window"):
			num.append(child.ID)
	var c = 1
	while num.has(c):
		c += 1
	return c

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$ClockBar/Time.text = Time.get_time_string_from_system()
	$ClockBar/Time.size.x = $ClockBar.size.x - 10
	
	#DEBUG new tab
	if Input.is_action_just_pressed("test_new_tab"):
		var screen_size = get_viewport_rect().size
		var new = window_instance.instantiate()
		new.position.x = randi_range(10,screen_size.x - 10)
		new.position.y = randi_range(10,screen_size.y - 10)
		new.ID = find_current_id()
		new.APP_ID = "Settings"
		add_child(new)
	
	fix_bars()
