extends DropZone

@onready var content = $Content
	
func add_decoration(draggable: Draggable):
	draggable.reparent(content)
