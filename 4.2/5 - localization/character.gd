extends Node2D

@export var texture: Texture2D = null
@export var text: String = ""

@onready var sprite_2d = $Sprite2D
@onready var text_bubble = $TextBubble

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.texture = texture
	text_bubble.update_label(text)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
