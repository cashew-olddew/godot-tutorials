extends Node2D

var _is_carving := false
const opacity = 0.5

signal finished_carving

@export var edge_color: Color = Color.BROWN
@export var polygon_color: Color = Color("FFA07A")

@onready var polygons = $Polygons
@onready var handles = $Handles

func _unhandled_input(event):
	if event.is_action_pressed("click"):
		var clicked_elements_count = get_clicked_nodes_count(event.position)
		if clicked_elements_count > 0:
			return
		if not _is_carving:
			start_new_carving()

		add_point(event.position)

func start_new_carving():
	_is_carving = true

	var polygon = Polygon2D.new()
	polygon.color = polygon_color
	polygon.color.a = opacity
	polygon.light_mask = 0
	polygons.add_child(polygon)

func add_point(pos: Vector2):
	var current_index = handles.get_child_count()
	
	var handle := Handle.get_instance(current_index, pos)
	handle.connect("clicked", _on_handle_clicked)
	handle.connect("moved", _on_handle_moved)
	
	handles.add_child(handle)
	
	update_polygon()
	pass

func _on_handle_clicked(index: int):
	if index == 0 and handles.get_child_count() >= 3:
		finish_current_carving()

func finish_current_carving():
	_is_carving = false

	remove_handles()
	update_polygon()
	finished_carving.emit(get_polygon())

func remove_handles():
	for handle in handles.get_children():
		handle.queue_free()
### Carving Movement ###

func _on_handle_moved():
	update_polygon()
	
func get_handle_positions():
	var positions: Array[Vector2] = []
	for handle in handles.get_children():
		positions.append(handle.position)
	return positions
	
func _draw():
	if handles.get_child_count() > 1 and not handles.get_child(0).is_queued_for_deletion():
		var handle_positions = get_handle_positions()
		for i in range(handle_positions.size() - 1):
			draw_line(handle_positions[i], handle_positions[i + 1], edge_color, 8)

func _build_polygon() -> Polygon2D:
	var handle_positions = []
	for handle in handles.get_children():
		handle_positions.append(handle.position)
		
	var polygon = Polygon2D.new()
	polygons.add_child(polygon)
	polygon.set_polygon(handle_positions)
	return polygon

### Utils ###

func get_polygon() -> Polygon2D:
	if polygons.get_child_count() > 0:	
		return polygons.get_children()[0]
	return null

func get_clicked_nodes_count(pos: Vector2) -> int:
	var query_parameter: PhysicsPointQueryParameters2D = PhysicsPointQueryParameters2D.new()
	query_parameter.set_collide_with_areas(true)
	query_parameter.position = pos
	var objects_clicked: Array[Dictionary] = get_world_2d().direct_space_state.intersect_point(query_parameter)
	return objects_clicked.size()
	
func update_polygon():
	var handle_positions = get_handle_positions()
	get_polygon().set_polygon(handle_positions)
	queue_redraw()
	
func update_colors():
	if polygons.get_child_count() > 0:
		var polygon = polygons.get_child(0)
		polygon.color = polygon_color
		polygon.color.a = opacity
	queue_redraw()
