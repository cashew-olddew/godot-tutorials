extends HBoxContainer

signal left_down
signal right_down

@export var text := "Swap"

@onready var label = $Label
@onready var button_left = $HBoxContainer/ButtonLeft
@onready var button_right = $HBoxContainer/ButtonRight

func _ready():
	label.text = text

func _on_button_left_button_down():
	left_down.emit()

func _on_button_right_button_down():
	right_down.emit()
