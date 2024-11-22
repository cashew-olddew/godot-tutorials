class_name Handle
extends Area2D

var dragging := false
var index := -1

const _HOLD_TIME_THRESHOLD := 0.2
var _click_started_time := 0

signal clicked
signal moved

static func get_instance(instance_index: int, pos: Vector2) -> Handle:
	const scene: PackedScene = preload("res://handle.tscn")
	
	var handle = scene.instantiate()
	handle.index = instance_index
	handle.position = pos
	
	return handle

func _process(_delta):
	if not dragging:
		return
	
	if position != get_global_mouse_position():
		position = get_global_mouse_position()
		moved.emit()

func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		modulate = Color.DARK_GOLDENROD
		dragging = true
		
		_click_started_time = Time.get_ticks_msec()
		
	if event.is_action_released("click"):
		modulate = Color.WHITE
		dragging = false
		
		var _click_released_time = Time.get_ticks_msec()
		var difference_sec = (_click_released_time - _click_started_time) / 1000.0
		if difference_sec < _HOLD_TIME_THRESHOLD:
			clicked.emit(index)
