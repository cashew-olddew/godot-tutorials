extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var tween = get_tree().create_tween().set_loops()
	
	#tween.tween_property(self, "position:x", 200, 2).as_relative()
	#tween.tween_property(self, "position:x", -200, 2).as_relative()
	
	tween.tween_property(self, "position:x", 1200, 2).from(-200)	
	pass
