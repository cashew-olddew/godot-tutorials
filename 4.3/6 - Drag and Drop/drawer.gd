extends Area2D
class_name Drawer

var is_dragging: bool = false
var drag_start = Vector2.ZERO
var velocity = Vector2.ZERO
var friction = 2
var max_velocity = INF

@onready var content = $Content
@onready var sprite = $Sprite

@export_category("Drawer Settings")
@export var left_limit := 0;
@export var right_limit := 0;

@export_category("Decoration Settings")
@export_dir var decoration_sprite_folder = ""
@export var decoration_count = 6
@export var decoration_scale = Vector2(1.0, 1.0)
@export_flags_2d_physics var decoration_collisions = 2
@export var separation = 100

signal successfully_dropped(draggable: Draggable)

func _ready():
	content.decoration_sprite_folder = decoration_sprite_folder
	content.decoration_count = decoration_count
	content.decoration_scale = decoration_scale
	content.decoration_collisions = decoration_collisions
	content.separation = separation
	content.connect("content_successfully_dropped", _on_draggable_successfully_dropped)
	content.initialize()

func _on_draggable_successfully_dropped(draggable: Draggable, area: Area2D):
	successfully_dropped.emit(draggable, area)

func _process(delta):
	if is_dragging:
		var mouse_position := get_global_mouse_position()
		var drag_delta = mouse_position.x - drag_start.x
		velocity.x = clamp(drag_delta, -max_velocity, max_velocity)
		
		drag_start = mouse_position
	else:
		velocity.x = lerp(velocity.x, 0.0, friction * delta)

	position.x += velocity.x
	position.x = clamp(position.x, left_limit, right_limit)
	
func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		is_dragging = true
		drag_start = event.position
		velocity = Vector2.ZERO
	
func _input(event):
	if is_dragging and event.is_action_released("click"):
		is_dragging = false
