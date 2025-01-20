extends Node2D
@onready var cursor = $Cursor

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	pass

func _process(_delta):
	cursor.position = get_global_mouse_position()


func _on_area_2d_mouse_entered():
	if cursor.z_index == 0:
		cursor.z_index = 2
	else:
		cursor.z_index = 0
	pass # Replace with function body.


func _on_button_button_down():
	cursor.play("loading")
	await get_tree().create_timer(2).timeout
	cursor.play("default")
	pass # Replace with function body.
