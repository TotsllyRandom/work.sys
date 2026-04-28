extends Control

var button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button = $VBoxContainer/DarkModeSettings/Button
	button.set_block_signals(true)
	button.button_pressed = GlobalSettings.dark_mode
	button.set_block_signals(false)
	GlobalSettings.dark_mode_changed.connect(fix_value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fix_value(value):
	button.set_block_signals(true)
	button.button_pressed = value
	button.set_block_signals(false)




func _on_button_toggled(toggled_on: bool) -> void:
	GlobalSettings.dark_mode = button.button_pressed
