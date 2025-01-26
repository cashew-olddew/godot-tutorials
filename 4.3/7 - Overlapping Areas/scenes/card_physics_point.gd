extends Area2D

@export_category("Textures")
@export var back_texture: Texture2D = null
@export var face_texture: Texture2D = null

@onready var back = $Back
@onready var face = $Face

var is_dragging = false
var click_position = Vector2.ZERO
func _ready():
	back.texture = back_texture
	face.texture = face_texture
	pass
	
func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position() - click_position

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		var query_parameter: PhysicsPointQueryParameters2D = PhysicsPointQueryParameters2D.new()
		query_parameter.position = event.position
		query_parameter.collide_with_areas = true
		
		var objects_clicked = get_world_2d().direct_space_state.intersect_point(query_parameter)
		# [{ "rid": RID(4329327034370), "collider_id": 30182212908, "collider": CardPhysicsPoint:<Area2D#30182212908>, "shape": 0 }]
		var colliders = objects_clicked.map(
			func(area):
				return area.collider
		)
		#[CardPhysicsPoint:<Area2D#30182212908>]
		colliders.sort_custom(
			func(c1, c2):
				return c1.z_index < c2.z_index
		)
		print(colliders)
		if colliders[-1] == self:
			is_dragging = true
			click_position = get_local_mouse_position()
		

func _input(event):
	if event.is_action_released("click"):
		is_dragging = false
