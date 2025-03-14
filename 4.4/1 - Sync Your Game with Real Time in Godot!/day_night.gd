extends Node2D

var day_nodes: Array = []
var night_nodes: Array = []
var autumn_nodes: Array = []

@onready var label = $CanvasLayer/Control/Label
@onready var canvas_modulate = $CanvasModulate

func _ready():
	day_nodes = get_tree().get_nodes_in_group("day")
	night_nodes = get_tree().get_nodes_in_group("night")
	autumn_nodes = get_tree().get_nodes_in_group("autumn")
	
	update_scene_based_on_time()

func update_scene_based_on_time():
	var now = Time.get_datetime_dict_from_system()
	
	print(Time.get_unix_time_from_system())
	
	var is_day = now.hour > 6 and now.hour < 21
	var is_night = not is_day
	var is_autumn = now.month >= Time.Month.MONTH_SEPTEMBER \
		and now.month <= Time.Month.MONTH_NOVEMBER
		
	toggle_nodes(day_nodes, is_day)
	toggle_nodes(night_nodes, is_night)
	toggle_nodes(autumn_nodes, is_autumn)
	pass

func toggle_nodes(nodes: Array[Node], visibility: bool):
	for node in nodes:
		node.visible = visibility
		
func _process(delta):
	var now = Time.get_datetime_dict_from_system()
	var seconds = now.second
	
	canvas_modulate.color = lerp(
		Color("#787878"),
		Color.WHITE,
		seconds / 60.0
	)
	
