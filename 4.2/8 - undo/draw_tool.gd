extends Node2D

var pressed = false
var current_line: Line2D = null
var inside_drawing_region = false
var gradient = Gradient.new()

var undo_redo: UndoRedo = UndoRedo.new()
@onready var canvas = $CanvasLayer/VBoxContainer/Canvas

func _input(event):
	if event.is_action_pressed("draw") && inside_drawing_region:
		pressed = true
		
		current_line = Line2D.new()
		current_line.begin_cap_mode = Line2D.LINE_CAP_ROUND
		current_line.end_cap_mode = Line2D.LINE_CAP_ROUND
		current_line.gradient = gradient
		
		undo_redo.create_action("Draw Line")
		undo_redo.add_do_method(canvas.add_child.bind(current_line))
		undo_redo.add_do_reference(current_line)
		undo_redo.add_undo_method(canvas.remove_child.bind(current_line))
		undo_redo.commit_action()
	
	if event.is_action_released("draw"):
		pressed = false
	
	if event is InputEventMouseMotion && pressed && inside_drawing_region:
		current_line.add_point(event.position - canvas.position)


func _on_canvas_mouse_entered():
	inside_drawing_region = true
	pass # Replace with function body.


func _on_canvas_mouse_exited():
	inside_drawing_region = false
	pass # Replace with function body.


func _on_undo_button_down():
	undo_redo.undo()
	pass # Replace with function body.


func _on_redo_button_down():
	undo_redo.redo()
	pass # Replace with function body.


func _on_randomize_color_button_down():
	var red: float = randf()
	var green: float = randf()
	var blue: float = randf()
	var color = Color(red, green, blue)
	
	var current_color = gradient.get_color(0)
	undo_redo.create_action("Randomize Colors")
	undo_redo.add_do_method(gradient.remove_point.bind(0))
	undo_redo.add_do_method(gradient.add_point.bind(0.5, color))
	undo_redo.add_undo_method(gradient.add_point.bind(0.5, current_color))
	undo_redo.add_undo_method(gradient.remove_point.bind(0))
	undo_redo.commit_action()
	pass # Replace with function body.
	

func _on_modulate_button_down():
	undo_redo.create_action("Modulate")
	undo_redo.add_do_property(current_line, "modulate", "c630d2")
	undo_redo.add_undo_property(current_line, "modulate", "ffffff")
	undo_redo.commit_action()
	pass # Replace with function body.


func _on_clear_history_button_down():
	undo_redo.clear_history()
	pass # Replace with function body.
