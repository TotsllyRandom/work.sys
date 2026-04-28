extends Node

var parent_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent_node = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if GlobalSettings.dark_mode:
		parent_node.add_theme_color_override("font_color", GlobalSettings.dark_mode_text)
		parent_node.add_theme_color_override("font_hover", GlobalSettings.dark_mode_text)
	else:
		parent_node.add_theme_color_override("font_color", GlobalSettings.light_mode_text)
		parent_node.add_theme_color_override("font_hover", GlobalSettings.light_mode_text)
