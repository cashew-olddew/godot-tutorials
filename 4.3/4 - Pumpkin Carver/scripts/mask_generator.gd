extends Node

@onready var sub_viewport: SubViewport = $SubViewport

func _ready():
	var _image_size = get_viewport().size
	
	sub_viewport.size = _image_size
	sub_viewport.render_target_clear_mode = SubViewport.CLEAR_MODE_ALWAYS
	sub_viewport.render_target_update_mode = SubViewport.UPDATE_ONCE
	
	var background = ColorRect.new()
	background.color = Color.WHITE
	background.size = _image_size
	sub_viewport.add_child(background)

func get_updated_mask(polygons: Array) -> ImageTexture:
	for polygon in polygons:
		polygon.color = Color.BLACK
		if polygon.get_parent():
			polygon.reparent(sub_viewport)
		else:
			sub_viewport.add_child(polygon)

	return await _get_drawn_texture()
	
func _get_drawn_texture() -> ImageTexture:
	sub_viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	await RenderingServer.frame_post_draw
	var image = sub_viewport.get_texture().get_image()
	var texture = ImageTexture.create_from_image(image)
	
	sub_viewport.render_target_update_mode = SubViewport.UPDATE_DISABLED
	
	return texture
	
func clear_mask() -> ImageTexture:
	for child in sub_viewport.get_children():
		# We don't remove the background
		if child is not ColorRect:
			child.queue_free()
	
	return await _get_drawn_texture()
	
func get_polygons() -> Array[Polygon2D]:
	var polygons: Array[Polygon2D] = []
	for child in sub_viewport.get_children():
		if child is Polygon2D:
			var new_polygon = Polygon2D.new()
			new_polygon.polygon = child.polygon
			polygons.append(new_polygon)
	return polygons
