extends CanvasLayer

@onready var margin_container = $MarginContainer
@onready var button_show = $ButtonShow

func _on_button_hide_button_down():
	margin_container.visible = false
	button_show.visible = true
	pass # Replace with function body.


func _on_button_show_button_down():
	margin_container.visible = true
	button_show.visible = false
	pass # Replace with function body.
