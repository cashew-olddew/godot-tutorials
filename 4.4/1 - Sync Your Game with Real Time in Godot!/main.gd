extends Node2D


var day_nodes: Array = []
var night_nodes: Array = []
var autumn_nodes: Array = []

@onready var texture_rect_night = $TextureRectNight
@onready var canvas_modulate = $CanvasModulate

@onready var timer = $Timer

var day_colors = [Color("#79a2c1"), Color("#9cd1fa")]
var night_colors = [Color("#231327"), Color("#131731")]

func _ready():
	day_nodes = get_tree().get_nodes_in_group("day")
	night_nodes = get_tree().get_nodes_in_group("night")
	autumn_nodes = get_tree().get_nodes_in_group("autumn")
	
	check_and_update_time()
	
	timer.wait_time = 1
	timer.timeout.connect(check_and_update_time)
	timer.start()

func check_and_update_time():
	var now = Time.get_datetime_dict_from_system()
	var current_hour = now["hour"]
	
	# Toggle day/night nodes
	toggle_nodes(day_nodes, current_hour >= 6 and current_hour <= 20)
	toggle_nodes(night_nodes, current_hour > 20 or current_hour < 6)

	# Check season
	var is_autumn = now["month"] >= Time.Month.MONTH_SEPTEMBER \
		&& now["month"] <= Time.Month.MONTH_NOVEMBER
		
	toggle_nodes(autumn_nodes, is_autumn)

func toggle_nodes(nodes: Array[Node], visibility: bool):
	for node in nodes:
		node.visible = visibility

func _process(delta):
	var now = Time.get_datetime_dict_from_system()
	print(now)
	var second = now["minute"]
	var rect_tex = texture_rect_night.texture
	if rect_tex is GradientTexture2D:
		var current_colors = [
			lerp(day_colors[0], night_colors[0], second / 60.0),
			lerp(day_colors[1], night_colors[1], second / 60.0)
		]
		rect_tex.gradient.set_color(0, current_colors[0])
		rect_tex.gradient.set_color(1, current_colors[1])
	pass
