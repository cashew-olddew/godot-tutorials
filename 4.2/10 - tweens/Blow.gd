extends Node2D

@onready var body = $Body
var blow_tween

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if event.is_action_pressed("blow"):
		blow_harder()
		
func blow_harder():
	if blow_tween:
		blow_tween.kill()
	blow_tween = get_tree().create_tween()
	
	blow_tween.tween_property(body, "scale", Vector2(0.2, 0.2), 0.3).as_relative()
	blow_tween.tween_property(body, "scale", Vector2(1, 1), 3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if body.scale > Vector2(1.5, 1.5):
		position.y -= 100 * delta
	else:
		position.y += 100 * delta
	pass
