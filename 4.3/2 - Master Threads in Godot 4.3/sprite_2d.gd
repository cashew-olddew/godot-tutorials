extends Sprite2D

const image_path = "res://assets/squirrel.jpg"

var thread = Thread.new()

func _input(event):
	if event.is_action_pressed("load_image"):
		if thread.is_alive():
			return
		thread.start(load_image)
		
func load_image():
	var tex = ResourceLoader.load(image_path)
	set_texture(tex)
	
func _exit_tree():
	thread.wait_to_finish()
