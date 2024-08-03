extends Area2D

@export var speed := 600.0
var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_tree().create_timer(1)
	timer.timeout.connect(_on_timer_timeout)
	direction = Vector2(cos(global_rotation), sin(global_rotation))
	pass # Replace with function body.

func _on_timer_timeout():
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += direction * speed * delta
	pass



func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
	pass # Replace with function body.
