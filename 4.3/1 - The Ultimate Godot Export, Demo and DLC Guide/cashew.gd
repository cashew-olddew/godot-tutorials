extends Area2D

@export var expanding_scale = Vector2(1.0, 1.0)

var clicks := 0
var click_tween
var initial_scale = Vector2(1.0, 1.0)

signal cashew_clicked

func _ready():
	initial_scale = scale

func _on_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed("click"):
		clicks += 1
		
		if click_tween:
			click_tween.kill()
		click_tween = create_tween()
		click_tween.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
		click_tween.tween_property(self, 'scale', expanding_scale, 0.1)
		click_tween.tween_property(self, 'scale', initial_scale, 0.1)
		
		cashew_clicked.emit()
	pass # Replace with function body.
