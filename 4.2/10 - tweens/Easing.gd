extends Node2D

@onready var daniel = $Daniel
@onready var the_cooler_daniel = $"The Cooler Daniel"

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween_daniel = get_tree().create_tween().set_loops()
	var tween_cooler_daniel = get_tree().create_tween().set_loops()
	
	tween_daniel.tween_property(daniel, "position", Vector2.UP * 200, .75).as_relative()
	tween_daniel.tween_property(daniel, "position", Vector2.DOWN * 200, .75).as_relative()
	
	tween_cooler_daniel.set_ease(Tween.EASE_IN_OUT)
	tween_cooler_daniel.set_trans(Tween.TRANS_SPRING)
	tween_cooler_daniel.tween_property(the_cooler_daniel, "position", Vector2.UP * 200, .75).as_relative()
	tween_cooler_daniel.tween_property(the_cooler_daniel, "position", Vector2.DOWN * 200, .75).as_relative()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
