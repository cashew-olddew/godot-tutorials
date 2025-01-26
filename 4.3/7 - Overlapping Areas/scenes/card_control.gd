extends Control

@export_category("Textures")
@export var back_texture: Texture2D = null
@export var face_texture: Texture2D = null

@onready var back = $Back
@onready var face = $Face

var is_dragging = false
var click_position = Vector2.ZERO
func _ready():
	back.texture = back_texture
	face.texture = face_texture
	pass
	
func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position() - click_position

func _input(event):
	if event.is_action_released("click"):
		is_dragging = false

func _on_gui_input(event):
	if event.is_action_pressed("click"):
		is_dragging = true
		click_position = get_local_mouse_position()
