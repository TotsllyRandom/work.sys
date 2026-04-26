extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fix_positioning()


func fix_positioning():
	#$"Dark Mode".position.y = 20
	#$DarkModeButton.position.y = 20
	#$"Dark Mode".position.x = 20
	if GlobalSettings.dark_mode:
		$"Dark Mode".add_theme_color_override("font_color", GlobalSettings.dark_mode_text)
	else:
		$"Dark Mode".add_theme_color_override("font_color", GlobalSettings.light_mode_text)
	#$DarkModeButton.position.x = get_parent().size.x - 20 - $DarkModeButton.size.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fix_positioning()
	

func _on_dark_mode_button_pressed() -> void:
	if GlobalSettings.dark_mode != $DarkModeButton.button_pressed:
		GlobalSettings.dark_mode = $DarkModeButton.button_pressed
