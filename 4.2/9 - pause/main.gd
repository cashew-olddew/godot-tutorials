extends Node2D

@onready var panel_container = $CanvasLayer/PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	panel_container.hide()
	pass # Replace with function body.
	
func _input(event):
	if event.is_action_pressed("pause"):
		swap_pause_state()

func swap_pause_state():
	if not panel_container.visible:
		panel_container.show()
		ShaderController.paused_shaders()
		get_tree().paused = true
	else:
		get_tree().paused = false
		ShaderController.unpaused_shaders()
		panel_container.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
