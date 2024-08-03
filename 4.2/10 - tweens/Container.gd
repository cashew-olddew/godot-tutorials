extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	for child in get_children():
		tween.tween_property(child, "position", Vector2.UP * 50, 1).as_relative()
		tween.tween_property(child, "position", Vector2.DOWN * 50, 1).as_relative()
	pass 
