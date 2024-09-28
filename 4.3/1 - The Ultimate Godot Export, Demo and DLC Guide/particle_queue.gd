extends Node2D

@export var particle: PackedScene
@export var sound: AudioStreamMP3
@export var queue_size := 8

@onready var particles = $Particles
@onready var sounds = $Sounds

var current_index := 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, queue_size):
		var particle_instance = particle.instantiate()
		particles.add_child(particle_instance)
		
		var audio_instance: AudioStreamPlayer2D = AudioStreamPlayer2D.new()
		audio_instance.stream = sound
		sounds.add_child(audio_instance)
	pass # Replace with function body.

func get_current() -> Types.WholeParticle:
	var whole_particle: Types.WholeParticle = Types.WholeParticle.new()
	whole_particle.particle = particles.get_child(current_index)
	whole_particle.sound = sounds.get_child(current_index)
	return whole_particle
	
func trigger():
	var current: Types.WholeParticle = get_current()
	current.particle.restart()
	
	current.sound.pitch_scale = randf_range(0.9, 1.1)
	current.sound.play()
	current_index = (current_index + 1) % queue_size
