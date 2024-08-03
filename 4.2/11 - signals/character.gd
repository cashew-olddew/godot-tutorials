extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 5

@onready var body = $Body

var rotation_direction = 0

signal taken_damage

func take_damage():
	taken_damage.emit(20)
	
	var tween = create_tween()
	tween.tween_property(body, 'modulate', Color.RED, 0.1)
	tween.tween_property(body, 'modulate', Color.WHITE, 0.1)

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = -transform.y * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	get_input()
	rotate(rotation_direction * rotation_speed * delta)
	move_and_slide()
