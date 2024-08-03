extends Area2D

@export var trap: Trap = null



func _on_body_entered(body):
	if trap:
		trap.activate()
	pass # Replace with function body.
