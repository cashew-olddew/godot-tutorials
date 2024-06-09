extends CPUParticles2D

var shader_material: ShaderMaterial

# Called when the node enters the scene tree for the first time.
func _ready():
	shader_material = material as ShaderMaterial
	ShaderController.connect("shader_pause_changed", _on_shader_pause_changed)
	pass # Replace with function body.

func _on_shader_pause_changed(paused):
	shader_material.set_shader_parameter("shader_paused", paused)
