extends VBoxContainer

var active_color: ColorRect = null
var current_index: int = 0
var color_shader = preload("res://shaders/color_rect_border.gdshader")

signal color_changed

@export var text: String = "Colors:"
@export var colors_count: int = 3
@export var tooltips: Array = []

@onready var colors_container: HBoxContainer = $ColorsContainer
@onready var color_picker: ColorPicker = $HBoxPicker/ColorPicker
@onready var h_box_picker: VBoxContainer = $HBoxPicker
@onready var label = $ColorsContainer/Label

var colors: Dictionary

func _ready():
	h_box_picker.visible = false
	label.text = text
	
	for i in range(colors_count):
		var color_rect: ColorRect = init_color_rect(i)
		colors_container.add_child(color_rect)
		if tooltips and tooltips[i]:
			color_rect.tooltip_text = tooltips[i]
		colors[i] = color_rect

func _on_color_apply_button_down():
	active_color.color = color_picker.color
	colors[current_index].color = color_picker.color
	color_changed.emit(current_index, color_picker.color)
	
	active_color = null
	h_box_picker.visible = false
	
func select_color_for_rect(event, rect_index: int):
	if event.is_action_pressed("click"):
		h_box_picker.visible = true
		active_color = colors[rect_index]
		current_index = rect_index
	
func init_color_rect(index):
	var color_rect = ColorRect.new()
	var mat = ShaderMaterial.new()
	var min_size = Vector2(28, 28);
	
	mat.shader = color_shader
	mat.set_shader_parameter("border_color", Color("44352f"))
	mat.set_shader_parameter("border_percentage", 0.1)
	mat.set_shader_parameter("sprite_size", min_size)

	color_rect.material = mat
	color_rect.custom_minimum_size = min_size
	color_rect.connect("gui_input", select_color_for_rect.bind(index))
	color_rect.size_flags_horizontal = Control.SIZE_SHRINK_END
	if index == 0:
		color_rect.size_flags_horizontal |= Control.SIZE_EXPAND
	
	return color_rect
