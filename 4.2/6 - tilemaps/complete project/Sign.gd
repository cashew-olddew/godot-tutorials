extends Area2D

func _on_body_entered(body):
	$Message.visible = true


func _on_body_exited(body):
	$Message.visible = false
