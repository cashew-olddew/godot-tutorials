extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Peanut Clicker 3000"
	if OS.has_feature('windows'):
		text += " - windows"
	elif OS.has_feature('web'):
		text += " - web"
	else:
		text += " - other platform"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
