extends Node

# https://en.wikipedia.org/wiki/Centroid#:~:text=.-,Of%20a%20polygon,-%5Bedit%5D
func get_polygon_center(polygon: Polygon2D) -> Vector2:
	var vert = polygon.polygon
	# Close the polygon
	vert.append(vert[0])
	var count = vert.size()

	var signed_area = 0
	for i in range(count - 1):
		var determinand = vert[i].x * vert[i+1].y - vert[i+1].x * vert[i].y
		signed_area += determinand / 2.0
		
	var center = Vector2.ZERO
	for i in range(count - 1):
		var determinand = vert[i].x * vert[i+1].y - vert[i+1].x * vert[i].y
		center.x += (vert[i].x + vert[i+1].x) * determinand / (6 * signed_area)
		center.y += (vert[i].y + vert[i+1].y) * determinand / (6 * signed_area)
	
	return center
	
func get_distance_between(p1: Vector2, p2: Vector2) -> float:
	var x_square = (p2.x - p1.x) * (p2.x - p1.x)
	var y_square = (p2.y - p1.y) * (p2.y - p1.y)
	
	return sqrt(x_square + y_square)
	
func get_deep_perspective(polygon: Polygon2D, scale_factor := 20) -> Polygon2D:
	var deep_carve: Polygon2D = Polygon2D.new()
	deep_carve.set_polygon(polygon.polygon)

	var visible_rect_size = get_viewport().get_visible_rect().size
	
	var screen_center: Vector2 = visible_rect_size / 2
	var polygon_center: Vector2 = Utils.get_polygon_center(deep_carve)
	var distance_to_center = Utils.get_distance_between(polygon_center, screen_center)
	var max_length = visible_rect_size.length() / 2
	var normalized_distance = clamp(distance_to_center / max_length, 0, 1)
	
	var movement_direction: Vector2 = (screen_center - polygon_center).normalized()
	var new_position: Vector2 = movement_direction * normalized_distance * scale_factor

	deep_carve.position = new_position
	return deep_carve
