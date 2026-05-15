extends Window

@export var tab_id: int
@export var APP_ID: String
@export var ID: int

@onready var current_scale = GlobalTab.tab_scale

var x_offset = 0
var y_offset = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func make_tab() -> void:
	min_size.x = $Content.window_x/2
	min_size.y = $Content.window_y/2
	fix_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	fix_position()

	title = $Content.window_name


func fix_position():
	if position.y < GlobalSettings.clock_bar_size:
		position.y = GlobalSettings.clock_bar_size


func _on_close_requested() -> void:
	queue_free()
