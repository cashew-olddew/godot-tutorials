extends Control

const LOADING_SCREEN = preload("res://loading_screen.tscn")

func _on_button_pressed():
	var loading_scene = LOADING_SCREEN.instantiate()
	loading_scene.next_scene = "res://large_scene.tscn"
	add_child(loading_scene)
	pass # Replace with function body.
