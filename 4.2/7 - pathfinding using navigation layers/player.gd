extends CharacterBody2D

const speed = 100
var input = Vector2.ZERO

@onready var animated_sprite = $AnimatedSprite
const FOOD = preload("res://food.tscn")

func _physics_process(_delta):
	get_input()
	move_and_slide()
	update_animation()
	
func get_input():
	input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input * speed

func _input(event):
	if event.is_action_pressed("food"):
		var instance = FOOD.instantiate()
		instance.global_position = global_position
		var foodCollection = get_tree().get_nodes_in_group("food")[0]
		foodCollection.add_child(instance)

func update_animation():
	var direction = velocity.normalized()
	
	var x_dir = "right" if direction.x > 0 else "left" if direction.x < 0 else ""
	var y_dir = "bottom" if direction.y > 0 else "top" if direction.y < 0 else ""
	
	var animation_map = {
		"right": {"bottom": "bottom-right", "top": "top-right", "": "right"},
		"left": {"bottom": "bottom-left", "top": "top-left", "": "left"},
		"": {"bottom": "bottom", "top": "top", "": "bottom"}
	}
	
	animated_sprite.play(animation_map[x_dir][y_dir])
