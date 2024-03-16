extends Node2D

var debug_enabled: bool = false
var debug: Dictionary = { }

func steer(
	velocity: Vector2,
	global_position: Vector2,
	target_position: Vector2,
	max_speed: float = 200.0,
	mass: float = 20.0,
):
	var desired_velocity = target_position - global_position
	var scaled_desired_velocity = desired_velocity.normalized() * max_speed
	
	var steer = (scaled_desired_velocity - velocity) / mass
	
	if debug_enabled:
		update_debug({
			"velocity": velocity,
			"scaled_desired_velocity": scaled_desired_velocity,
			"steer": steer
		})
		
	return velocity + steer
	
func update_debug(dict):
	for key in dict:
		debug[key] = dict[key]
		
func _process(_delta):
	queue_redraw()
	
func _draw():
	if not debug_enabled:
		return
		
	draw_line(position, debug["velocity"], Color.BLACK, 4.0)
	draw_line(position, debug["scaled_desired_velocity"], Color.RED, 4.0)
	draw_line(debug["velocity"], debug["scaled_desired_velocity"], Color.BLUE, 4.0)
	draw_circle(debug["velocity"], 6.0, Color.BLACK)
	draw_circle(debug["scaled_desired_velocity"], 6.0, Color.RED)
