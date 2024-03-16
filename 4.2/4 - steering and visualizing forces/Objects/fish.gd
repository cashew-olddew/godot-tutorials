extends CharacterBody2D

@onready var sprite_fish = $SpriteFish
@onready var steer_component = $SteerComponent

@export var max_speed: float = 100.0
@export var mass: float = 40.0

func _ready():
	steer_component.debug_enabled = true

func _physics_process(delta):
	var target = get_global_mouse_position()
	
	sprite_fish.rotation = velocity.angle()

	velocity = steer_component.steer(
		velocity,
		global_position,
		target,
		max_speed,
		mass
	)

	move_and_slide()
