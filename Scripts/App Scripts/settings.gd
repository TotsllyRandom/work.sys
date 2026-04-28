extends Control

var button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button = $VBoxContainer/DarkModeSettings/Button
	button.button_pressed = GlobalSettings.dark_mode


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (button.button_pressed != GlobalSettings.dark_mode):
		button.button_pressed = GlobalSettings.dark_mode


func _on_dark_mode_button_pressed() -> void:
	if (button.button_pressed != GlobalSettings.dark_mode):
		GlobalSettings.dark_mode = button.button_pressed
