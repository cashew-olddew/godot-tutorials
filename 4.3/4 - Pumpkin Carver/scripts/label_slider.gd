extends HBoxContainer

signal slider_changed

@export var text: String = "Label"
@export var max_value: int = 10

@onready var label = $Label
@onready var h_slider = $HSlider

func _ready():
	label.text = text
	h_slider.max_value = max_value
	h_slider.step = max_value % 10

func _on_h_slider_value_changed(value):
	slider_changed.emit(value)
	pass # Replace with function body.
