extends Area2D
class_name Draggable

const DRAGGING_SPEED = 50

var initial_position := Vector2.ZERO
var initial_scale := Vector2.ZERO
var is_dragging = false
var texture: Texture

signal dropped

@onready var sprite = $Sprite
@onready var collision_shape = $CollisionShape

func _ready():
	if texture:
		sprite.texture = texture
	initial_position = position
	initial_scale = scale
	play_spawn_animation()

func _process(delta):
	if is_dragging:
		global_position = lerp(
			global_position, get_global_mouse_position(), 
			delta * DRAGGING_SPEED
		)
	
func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		is_dragging = true

func _input(event):
	if event.is_action_released("click") and is_dragging:
		is_dragging = false
		var overlapping_areas = get_overlapping_areas()
		dropped.emit(self, overlapping_areas)
		if not overlapping_areas:
			self_destruct()

func self_destruct():
	await play_self_destruct_animation()
	queue_free()

func play_spawn_animation():
	scale = Vector2.ZERO
	get_tree().create_tween() \
		.tween_property(self, "scale", initial_scale, 0.3) \
		.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)

func play_self_destruct_animation():
	await get_tree().create_tween() \
		.tween_property(self, "scale", Vector2(0.0, 0.0), 0.1) \
		.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD).finished
