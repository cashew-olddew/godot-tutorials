extends Node2D

const DRAGGABLE = preload("res://scenes/draggable.tscn")

@export var decoration_sprite_folder = ""
@export var decoration_count = 0
@export var decoration_scale = Vector2(1.0, 1.0)
@export_flags_2d_physics var decoration_collisions = 2
@export var separation = 100

signal content_successfully_dropped(draggable: Draggable, area: Area2D)

func initialize():
	var textures_from_folder: Array = load_textures_from_folder(decoration_sprite_folder)
	for i in range(decoration_count):
		var pos_x = global_position.x + i * separation
		var pos_y = global_position.y
		var new_position = to_local(Vector2(pos_x, pos_y))
		
		var current_texture = null
		var tex_number = textures_from_folder.size()
		if tex_number > 0:
			current_texture = textures_from_folder[i % tex_number]
		instantiate_decoration(new_position, current_texture)

func instantiate_decoration(pos: Vector2, texture: Texture = null):
	var decoration: Draggable = DRAGGABLE.instantiate()
	decoration.position = pos
	decoration.collision_mask = decoration_collisions
	decoration.scale = decoration_scale
	
	if texture:
		decoration.texture = texture

	decoration.connect("dropped", _on_draggable_dropped)
	add_child(decoration)

func _on_draggable_dropped(draggable: Draggable, overlapping_areas: Array[Area2D]):
	# Pass the texture of the current draggable to the new one
	instantiate_decoration(draggable.initial_position, draggable.texture)
	if overlapping_areas:
		draggable.disconnect("dropped", _on_draggable_dropped)
		content_successfully_dropped.emit(draggable, overlapping_areas[0])
		
func load_textures_from_folder(folder_path: String) -> Array:
	var textures = []
	var dir = DirAccess.open(folder_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and file_name.ends_with(".png"):
				var texture_path = folder_path + "/" + file_name
				textures.append(load(texture_path))
			file_name = dir.get_next()
		dir.list_dir_end()
	return textures
