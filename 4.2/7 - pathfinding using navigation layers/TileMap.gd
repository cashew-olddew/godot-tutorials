extends TileMap

func _use_tile_data_runtime_update(layer, coords):
	if coords in get_used_cells_by_id(1):
		return true
	return false

func _tile_data_runtime_update(layer: int, coords: Vector2i, tile_data: TileData):
	tile_data.set_navigation_polygon(0, null)
