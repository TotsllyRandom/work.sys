extends Control

# variables to hold x and y mouse offset when moving
@export var x_mouse_offset = -1
@export var y_mouse_offset = -1
@export var id = -1

@export var mouse_on_tab : bool = false
@export var mouse_on_bar : bool = false
@export var mouse_on_button : bool = false

signal move_me_to_the_top(my_num)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var b = $CloseButton
	var t = $TopBar/Title
	$Outline.position.x = -3
	$Outline.position.y = -3
	$Outline.size.x = $Background.size.x + 6
	$Outline.size.y = $Background.size.y + 6
	
	b.position.x = $TopBar.size.x - 30
	t.text = str(id)
	t.size.y = $TopBar.size.y
	t.size.x = $TopBar.size.x - 10
	t.position.x = 5
	b = $Button
	b.size = $Background.size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# delete un-instanced tabs
	if id<0:
		queue_free()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and (id == GlobalTab.current_tab_focused):
		var mouse_pos = get_viewport().get_mouse_position()
		if y_mouse_offset<0 and mouse_on_bar and not mouse_on_button:
			x_mouse_offset = mouse_pos.x - position.x
			y_mouse_offset = mouse_pos.y - position.y
			GlobalTab.moving_tab = true
		elif GlobalTab.moving_tab:
			position.y = mouse_pos.y - y_mouse_offset
			position.x = mouse_pos.x - x_mouse_offset
			GlobalTab.current_tab_focused = id
	else:
		y_mouse_offset = -1
		if id == GlobalTab.current_tab_focused:
			GlobalTab.moving_tab = false
	
	if not GlobalTab.current_tab_focused == id:
		$Button.visible = true


func _on_top_bar_mouse_entered() -> void:
	mouse_on_bar = true


func _on_top_bar_mouse_exited() -> void:
	mouse_on_bar = false


func _on_close_button_pressed() -> void:
	queue_free()


func _on_button_mouse_entered() -> void:
	mouse_on_button = true


func _on_button_mouse_exited() -> void:
	mouse_on_button = false


func _on_focus_button_down() -> void:
	if not GlobalTab.current_tab_focused == id:
		$Button.visible = false
		GlobalTab.current_tab_focused = id
		move_me_to_the_top.emit(id)
