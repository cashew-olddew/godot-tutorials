extends CharacterBody2D

var movement_speed = 50.0
@export var target: Node2D = null

@onready var navigation_agent_2d = $NavigationAgent2D
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("seeker_setup")
	pass # Replace with function body.

func seeker_setup():
	await get_tree().physics_frame
	if target:
		navigation_agent_2d.target_position = target.global_position
		
func acquire_target():
	var food_container = get_tree().get_nodes_in_group("food")[0]
	var available_food = food_container.get_children()
	
	if !available_food.is_empty():
		var new_target = available_food[0]
		target = new_target

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_instance_valid(target):
		navigation_agent_2d.target_position = target.global_position
	else:
		acquire_target()
	if navigation_agent_2d.is_navigation_finished():
		return
		
	var current_agent_position = global_position
	var next_path_position = navigation_agent_2d.get_next_path_position()
	var new_velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	
	if navigation_agent_2d.avoidance_enabled:
		navigation_agent_2d.set_velocity(new_velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(new_velocity)
	
	move_and_slide()
	animated_sprite_2d.flip_h = false if velocity.x > 0 else true
	pass


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	pass # Replace with function body.
