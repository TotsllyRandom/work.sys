extends Control

var current_screen: int = 1
# 1 - home
# 2 - rules
# 3 - stats

@onready var hb = $"Top Buttons/home"
@onready var rb = $"Top Buttons/rules"
@onready var sb = $"Top Buttons/stats"

@onready var hs = $Home
@onready var rs = $Rules
@onready var ss = $Stats

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fix()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_rules():
	var rl = rs.get_child(0)
	rl.text = ""

func fix():
	match current_screen:
		1:
			hs.visible = true
			rs.visible = false
			ss.visible = false
		2:
			hs.visible = false
			rs.visible = true
			ss.visible = false
		3:
			hs.visible = false
			rs.visible = false
			ss.visible = true


func _on_home_pressed() -> void:
	current_screen = 1
	fix()


func _on_stats_pressed() -> void:
	current_screen = 3
	fix()


func _on_rules_pressed() -> void:
	current_screen = 2
	fix()
