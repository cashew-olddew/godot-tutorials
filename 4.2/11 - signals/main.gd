extends Node2D

var total_damage := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_taken_damage(damage):
	total_damage += damage
	
	print("Total damage taken: ", total_damage)
	pass # Replace with function body.
