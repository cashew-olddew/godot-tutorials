extends Node2D

@onready var cashew = $Cashew
@onready var label_score = %LabelScore
@onready var particle_queue = $Particles/ParticleQueue

func _ready():
	if OS.has_feature('demo'):
		particle_queue.hide()
		
	#var root = ProjectSettings.globalize_path("res://")
	#var res = ProjectSettings.load_resource_pack(root + "dlc/subscribe.zip")
	#if res:
		#var sub_scene = load("res://dlc/subscribe/subscribe.tscn")
		#add_child(sub_scene.instantiate())
		
	var sub_scene = DlcManager.dlc_loads["dlc/subscribe/subscribe.tscn"]
	if sub_scene:
		add_child(sub_scene.instantiate())
func _process(delta):
	label_score.text = "Cashews Clicked: " + str(cashew.clicks)
	pass


func _on_cashew_clicked():
	var current_particle: Types.WholeParticle = particle_queue.get_current()
	current_particle.particle.global_position = get_global_mouse_position()
	current_particle.sound.global_position = get_global_mouse_position()
	
	particle_queue.trigger()
	pass # Replace with function body.
