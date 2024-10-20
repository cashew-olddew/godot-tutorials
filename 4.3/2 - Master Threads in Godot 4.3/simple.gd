extends HBoxContainer

@export var max_value := 100
@onready var pb = $TextureProgressBar

func _ready() -> void:
	pb.value = 0
	pb.max_value = max_value
	pass
	
func pretend_you_are_loading(maximum: int) -> void:
	for i in range(maximum):
		update_progress_bar(1)
		await get_tree().create_timer(0.03).timeout

func update_progress_bar(increment):
	pb.value += increment
	
func _on_button_pressed():
	await pretend_you_are_loading(50)
	await pretend_you_are_loading(50)
	pass # Replace with function body.
