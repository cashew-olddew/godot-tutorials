extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var tween = get_tree().create_tween().set_parallel(true)
	
	tween.tween_property(self, "scale", Vector2.ONE * 2, 2)
	tween.tween_property(self, "position", Vector2.DOWN * 200, 2).as_relative()
	pass # Replace with function body.

func shrunk(message):
	print(message)
