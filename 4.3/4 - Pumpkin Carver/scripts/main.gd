extends Node2D

var _carve_depth: int = 60

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var carver = $Carver

@onready var mask_generator = $MaskGenerators/MaskGenerator
@onready var deep_mask_generator = $MaskGenerators/DeepMaskGenerator

@onready var back = $Pumpkin/Back
@onready var light = $Pumpkin/Light
@onready var middle = $Pumpkin/Middle
@onready var front = $Pumpkin/Front

@onready var image_cycler: ImageCycler = $Background/BackgroundCycler
@onready var back_cycler = $Pumpkin/Cyclers/BackCycler
@onready var middle_cycler = $Pumpkin/Cyclers/MiddleCycler
@onready var front_cycler = $Pumpkin/Cyclers/FrontCycler
@onready var overlay_cycler = $Overlay/OverlayCycler

func _ready():
	middle.material = front.material.duplicate()

func _on_carver_finished_carving(polygon: Polygon2D) -> void:
	var deep_carve = Utils.get_deep_perspective(polygon, _carve_depth)
	
	var texture: ImageTexture = await mask_generator.get_updated_mask([polygon])
	var deep_texture: ImageTexture = await deep_mask_generator.get_updated_mask([deep_carve])
	
	front.material.set_shader_parameter("mask_texture", texture)
	middle.material.set_shader_parameter("mask_texture", deep_texture)

func _on_cycler_pumpkin_left_down() -> void:
	back_cycler.cycle(ImageCycler.Direction.LEFT)
	middle_cycler.cycle(ImageCycler.Direction.LEFT)
	front_cycler.cycle(ImageCycler.Direction.LEFT)

func _on_cycler_pumpkin_right_down() -> void:
	back_cycler.cycle(ImageCycler.Direction.RIGHT)
	middle_cycler.cycle(ImageCycler.Direction.RIGHT)
	front_cycler.cycle(ImageCycler.Direction.RIGHT)

func _on_cycler_bg_left_down():
	image_cycler.cycle(ImageCycler.Direction.LEFT)

func _on_cycler_bg_right_down():
	image_cycler.cycle(ImageCycler.Direction.RIGHT)

func _on_pumpkin_colors_color_changed(index: int, color: Color):
	match index:
		0:
			front.material.set_shader_parameter("color", color)
		1:
			middle.material.set_shader_parameter("color", color)
		2:
			light.color = color
		3:
			back.modulate = color
		_:
			print("How did you get here...?")

func _on_polygon_colors_color_changed(index: int, color: Color):
	match index:
		0:
			carver.polygon_color = color
			carver.update_colors()
		1:
			carver.edge_color = color
			carver.update_colors()
		_:
			print("How did you get here...?")

func _on_label_slider_light_slider_changed(value):
	light.energy = value

func _on_label_slider_depth_slider_changed(value):
	_carve_depth = value
	deep_mask_generator.clear_mask()
	
	var polygons: Array[Polygon2D] = mask_generator.get_polygons()
	var deep_carvings = polygons.map(
		func(polygon): return Utils.get_deep_perspective(polygon, _carve_depth)
	)
		
	var new_deep_texture = await deep_mask_generator.get_updated_mask(deep_carvings)
	middle.material.set_shader_parameter("mask_texture", new_deep_texture)

func _on_restart_button_down() -> void:
	var texture: ImageTexture = await mask_generator.clear_mask()
	var deep_texture: ImageTexture = await deep_mask_generator.clear_mask()
	
	front.material.set_shader_parameter("mask_texture", texture)
	middle.material.set_shader_parameter("mask_texture", deep_texture)

func _on_button_save_button_down() -> void:
	canvas_layer.visible = false
	await RenderingServer.frame_post_draw
	var image = get_viewport().get_texture().get_image()
	image.save_png("res://screenshot.png")
	download_file(image, "screenshot")
	
	canvas_layer.visible = true
	
func download_file(image: Image, filename: String):
	var buffer = image.save_png_to_buffer()
	JavaScriptBridge.download_buffer(buffer, filename + ".png")

func _on_cycler_overlay_left_down():
	overlay_cycler.cycle(ImageCycler.Direction.LEFT)

func _on_cycler_overlay_right_down():
	overlay_cycler.cycle(ImageCycler.Direction.RIGHT)
