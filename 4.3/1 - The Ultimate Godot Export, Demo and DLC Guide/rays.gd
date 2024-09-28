extends Node2D

# This could have an array of Ray Scenes with their properties
# Each would have a rotation amount and size

@export var rotation_big := 0.0
@export var rotation_medium := 0.0
@export var rotation_small := 0.0

@onready var rays_big = $RaysBig
@onready var rays_medium = $RaysMedium
@onready var rays_small = $RaysSmall

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rays_big.rotate(deg_to_rad(rotation_big) * delta)
	rays_medium.rotate(deg_to_rad(rotation_medium) * delta) 
	rays_small.rotate(deg_to_rad(rotation_small) * delta) 
	pass
