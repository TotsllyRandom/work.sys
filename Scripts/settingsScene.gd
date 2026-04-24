extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DarkModeButton.button_pressed = GlobalSettings.dark_mode


func fix_positioning():
	$"Dark Mode".position.y = -20
	$DarkModeButton.position.y = -20
	$"Dark Mode".position.x = 20
	$DarkModeButton.position.x = get_parent().size.x - 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalSettings.dark_mode != $DarkModeButton.button_pressed:
		GlobalSettings.dark_mode = $DarkModeButton.button_pressed
