class_name Trap
extends Node2D

var projectile_scene: PackedScene = preload("res://arrow.tscn")

@onready var spawning_points = $SpawningPoints

func activate():
	for spawn in spawning_points.get_children():
		var instance = projectile_scene.instantiate()
		spawn.call_deferred("add_child", instance)
