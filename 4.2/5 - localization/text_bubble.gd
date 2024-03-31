extends Control

@export var text: String = ""
@export var direction: bool = false

@onready var label = $PanelContainer/Label
@onready var panel_container = $PanelContainer

func setup_direction():
	if direction == true:
		panel_container.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_RIGHT)

# Called when the node enters the scene tree for the first time.
func _ready():
	update_label(text)
	#setup_direction()
	pass # Replace with function body.

func update_label(text):
	label.text = text
