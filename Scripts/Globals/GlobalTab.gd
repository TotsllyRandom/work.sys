extends Node

var is_moving: bool = false
var tab_moving: int = -1

var APP_NAMES = ["Settings", "Quickloans - Account Manager", "Quickloans - Loan Front"]
var RULES = [
	"Do not accept anyone under the age of 18",
	"Accept anyone with a credit over 650",
	"Do not accept any loans with interest rates under 1%"
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
