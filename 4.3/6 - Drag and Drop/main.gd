extends Node2D

@onready var drawers = $Drawers
@onready var christmas_tree = $Tree/ChristmasTree

func _ready():
	for child in drawers.get_children():
		if child is Drawer:
			child.connect("successfully_dropped", _on_successfully_dropped)
			
func _on_successfully_dropped(decoration: Draggable, area: Area2D):
	if area is DropZone:
		area.add_decoration(decoration)
