extends Area2D


func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	pass # Replace with function body.


func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	pass # Replace with function body.
