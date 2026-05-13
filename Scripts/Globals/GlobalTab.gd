extends Node

var is_moving: bool = false
var tab_moving: int = -1
var tab_scale: int = 1

signal fix()

var APP_NAMES = ["Settings", "Quickloans - Account Manager", "Quickloans - Loan Front"]
var RULES = [
	"Do not accept anyone under the age of 21",
	"Accept anyone with a credit over 650",
	"Deny any unemployed customers",
	"Approve any returning customers",
	"Do not accept any loans with interest rates under 1%"
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	emit_fix()
	get_viewport().size_changed.connect(emit_fix)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func emit_fix():
	fix.emit()
