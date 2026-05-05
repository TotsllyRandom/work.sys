extends Node

var parent_node
@export var text_base_scale: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent_node = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parent_node.add_theme_font_size_override("font_size",(text_base_scale*10 + GlobalSettings.global_text_add))
