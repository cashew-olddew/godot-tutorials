extends Node2D

var scale_factor = 0.05

var polygons: Array[Polygon2D] = []

func _ready():
	var poly = Polygon2D.new()
	poly.set_polygon([
		Vector2(100, 100), 
		Vector2(100, 200), 
		Vector2(200, 200), 
		Vector2(200, 100)])
	polygons.append(poly)
	
	poly = Polygon2D.new()
	poly.set_polygon([
		Vector2(300, 300), 
		Vector2(300, 400), 
		Vector2(400, 400), 
		Vector2(400, 300)])
	polygons.append(poly)
	
	poly = Polygon2D.new()
	poly.set_polygon([
		Vector2(700, 300), 
		Vector2(700, 400), 
		Vector2(800, 400), 
		Vector2(800, 300)
	])
	polygons.append(poly)
	for p in polygons:
		add_child(p)
	queue_redraw()

func get_deep_perspective(polygon: Polygon2D) -> Polygon2D:
	var screen_center: Vector2 = get_viewport().size / 2
	var polygon_center: Vector2 = Utils.get_polygon_center(polygon)
	var distance_to_center = Utils.get_distance_between(polygon_center, screen_center)
	var max_length = get_viewport().size.length() / 2
	var normalized_distance = clamp(distance_to_center / max_length, 0, 1)
	
	if distance_to_center < 50.0:
		return polygon
	
	var movement_direction: Vector2 = (screen_center - polygon_center).normalized()
	var new_position: Vector2 = movement_direction * normalized_distance * scale_factor

	polygon.position = new_position
	return polygon

func _draw():
	for p in polygons:
		var p_v = p.polygon
		for i in range(p_v.size() - 1):
			draw_line(p_v[i], p_v[i+1], Color.GREEN, 5)
		draw_line(p_v[p_v.size() - 1], p_v[0], Color.GREEN, 5)
		

func _on_h_slider_value_changed(value):
	scale_factor = value
	for p in polygons:
		get_deep_perspective(p)
	pass # Replace with function body.
