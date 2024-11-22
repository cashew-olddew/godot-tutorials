class_name Food
extends Sprite2D

enum FOOD_TYPE {
	VEGETABLE,
	FRUIT,
	MEAT,
	OTHER
}

var naming := ""

@export var ingredient: Texture2D
@export var type: FOOD_TYPE
@onready var content = $Content

func _ready():
	if ingredient:
		naming = ingredient.resource_path.get_file().get_basename()
	content.texture = ingredient
	
func update_texture():
	content.texture = ingredient
