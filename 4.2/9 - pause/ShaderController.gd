extends Node

var shader_paused = false

signal shader_pause_changed(shader_paused)

func paused_shaders():
	shader_paused = true
	emit_signal("shader_pause_changed", shader_paused)
	
func unpaused_shaders():
	shader_paused = false
	emit_signal("shader_pause_changed", shader_paused)
