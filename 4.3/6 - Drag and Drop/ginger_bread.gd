extends DropZone

@onready var markers = $Markers
@onready var content = $Content

var marker_status: Dictionary = {}

func _ready():
	for marker in markers.get_children():
		if marker is Marker2D:
			marker_status[marker] = null

func add_decoration(decoration: Draggable):
	decoration.reparent(content)
	decoration.connect("dropped", 
		func(_dragged, _overlapping_areas):
			reset_marker_status(_dragged)
			find_a_place(_dragged)
	)
	find_a_place(decoration)

func find_a_place(decoration):
	var closest_marker = get_closest_marker(decoration)
	if marker_status[closest_marker] != null:
		var occupant = marker_status[closest_marker]
		var empty_marker = find_empty_marker()
		if empty_marker:
			move_to_marker(occupant, empty_marker)
		elif occupant is Draggable:
			occupant.self_destruct()
		else:
			print("You shouldn't be here...")

	move_to_marker(decoration, closest_marker)

func find_empty_marker() -> Marker2D:
	for marker in marker_status.keys():
		if marker_status[marker] == null:
			return marker
	return null

func move_to_marker(node: Node2D, marker: Marker2D):
	get_tree().create_tween().tween_property(
		node,
		"position",
		marker.position,
		0.5
	).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
	marker_status[marker] = node

func get_closest_marker(decoration: Draggable) -> Marker2D:
	var closest_marker: Marker2D = null
	var min_distance = 100000.0
	for marker in marker_status.keys():
		var distance = decoration.position.distance_to(marker.position)
		if distance < min_distance:
			min_distance = distance
			closest_marker = marker
	
	return closest_marker

func reset_marker_status(decoration: Draggable):
	for marker in marker_status.keys():
		if marker_status[marker] == decoration:
			marker_status[marker] = null
			break
