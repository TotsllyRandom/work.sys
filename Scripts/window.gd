extends ColorRect

@export var border_size = float(GlobalSettings.window_border_size)
@export var tab_id: int
@export var on_window: bool
@export var on_bar: bool
@export var APP_ID: int = -1
@export var ID: int
@export var layer: int

var x_offset = 0
var y_offset = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await APP_ID >= 0
	$Content.build_app(APP_ID)

func make_tab(size_var) -> void:
	size.x = $Content.window_x + border_size
	size.y = $Content.window_y + border_size
	$TopBar/CloseButton.visible = $Content.has_close_button
	
	$TopBar.size.x = size.x - border_size
	$TopBar.position.x = border_size / 2
	$TopBar.position.y = border_size / 2
	$TopBar/Title.position.x = border_size / 2
	$TopBar/Title.size.y = 30
	
	if $TopBar/CloseButton.visible:
		$TopBar/CloseButton.position.x = $TopBar.size.x - 30
		
		$TopBar/Border.position.x = $TopBar/CloseButton.position.x - border_size / 2
		$TopBar/Border.position.y = $TopBar/CloseButton.position.y - border_size / 2
		$TopBar/Border.size.x = $TopBar/CloseButton.size.x + border_size
		$TopBar/Border.size.y = $TopBar/CloseButton.size.y + border_size
		$TopBar/Border.scale.x = $TopBar/CloseButton.scale.x
		$TopBar/Border.scale.y = $TopBar/CloseButton.scale.y
	
	$Content.size.y = size.y - border_size - 30
	$Content.position.y = border_size / 2 + 30
	$Content.size.x = size.x - border_size
	$Content.position.x = border_size / 2
	
	$Border.size.y =  $TopBar.size.y + border_size
	$Border.size.x = size.x
	fix_window()

func fix_window():
	if GlobalSettings.dark_mode:
		$Content.color = GlobalSettings.dark_mode_background
		$TopBar.color = GlobalSettings.dark_mode_bar
	else:
		$Content.color = GlobalSettings.light_mode_background
		$TopBar.color = GlobalSettings.light_mode_bar
	
	fix_position()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var papa = get_parent()
	var mouse_pos = get_global_mouse_position()
	
	var content_kids = $Content.get_children()
	$TopBar/Title.text = content_kids[0].name
	if GlobalTab.is_moving == false:
		if (on_window or on_bar) and Input.is_mouse_button_pressed(1):
			papa.move_child(self, papa.get_child_count() - 1)
			if on_bar:
				GlobalTab.tab_moving = ID
				GlobalTab.is_moving = true
				x_offset = position.x - mouse_pos.x
				y_offset = position.y - mouse_pos.y
	
	if GlobalTab.tab_moving == ID:
		if not Input.is_mouse_button_pressed(1):
			GlobalTab.tab_moving = 0
			GlobalTab.is_moving = false
		else:
			position.x = mouse_pos.x + x_offset
			position.y = mouse_pos.y + y_offset
	
	fix_window()

func _on_mouse_entered() -> void:
	on_window = true

func _on_mouse_exited() -> void:
	on_window = false


func _on_top_bar_mouse_entered() -> void:
	on_bar = true

func _on_top_bar_mouse_exited() -> void:
	on_bar = false


func _on_close_button_pressed() -> void:
	queue_free()

func fix_position() -> void:
	var screen_size = get_viewport_rect().size
	if position.x < 0:
		position.x = 0
	if position.x > screen_size.x - size.x:
		position.x = screen_size.x - size.x 
	
	if position.y < GlobalSettings.clock_bar_size:
		position.y = GlobalSettings.clock_bar_size
	if position.y > screen_size.y - size.y - GlobalSettings.toolbar_size:
		position.y = screen_size.y - size.y - GlobalSettings.toolbar_size
