extends ColorRect

@export var border_size = float(GlobalSettings.window_border_size)
@export var tab_id: int
@export var on_window: bool
@export var on_bar: bool
@export var on_button: bool

signal move_to_top(z)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func make_tab(size_var) -> void:
	match size_var:
		1: #Normal Window
			size.x = 480 + border_size
			size.y = 340 + border_size
			$TopBar/CloseButton.visible = true
		2: #Vertical Window
			size.x = 240 + border_size
			size.y = 340 + border_size
			$TopBar/CloseButton.visible = true
		3: #Notification
			size.x = 300 + border_size
			size.y = 170 + border_size
			$TopBar/CloseButton.visible = false
	
	$TopBar.size.x = size.x - border_size
	$TopBar.position.x = border_size / 2
	$TopBar.position.y = border_size / 2
	
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
	if GlobalSettings.dark_mode:
		$Content.color = GlobalSettings.dark_mode_background
		$TopBar.color = GlobalSettings.dark_mode_bar
	else:
		$Content.color = GlobalSettings.light_mode_background
		$TopBar.color = GlobalSettings.light_mode_bar
	
	$Border.size.y =  $TopBar.size.y + border_size
	$Border.size.x = size.x
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$TopBar/Title.text = str(on_window)
	if on_window and Input.is_mouse_button_pressed(1):
		move_to_top.emit(z_index)


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
