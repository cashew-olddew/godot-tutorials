class_name ImageCycler
extends Node

@export var directory: String = "res://assets"
@export var prefix: String
@export var sprite: Sprite2D

var index: int = 0

enum Direction { LEFT, RIGHT }

func cycle(dir: Direction):
	next_index(dir)
	var texture = get_current_texture()
	sprite.texture = texture

func get_current_texture():
	var filename = "%s%d%s" % [prefix, index, '.png']
	var dir = DirAccess.open(directory)
	if dir and dir.file_exists(filename + ".import"):
		return load(directory + "/" + filename)

func next_index(dir: Direction):
	var image_count = get_image_count()
	if not image_count:
		return
		
	if dir == Direction.LEFT:
		index -= 1
		if index < 0:
			index = image_count - 1
	if dir == Direction.RIGHT:
		index = (index + 1) % image_count

func get_image_count():
	var dir = DirAccess.open(directory)
	if dir:
		var all_files = Array(dir.get_files())
		var files = all_files.filter(
			func(string: String): return string.ends_with(".png.import")
		).filter(
			func(string: String): return string.begins_with(prefix)
		)
		return files.size()
	return 0
		
