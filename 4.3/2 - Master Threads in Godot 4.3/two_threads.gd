extends HBoxContainer

@export var max_value := 100
@onready var pb = $TextureProgressBar

var thread: Thread

func _ready() -> void:
	pb.value = 0
	pb.max_value = max_value
	
	thread = Thread.new()
	pass
	
func pretend_you_are_loading(maximum: int) -> void:
	for i in range(maximum):
		call_deferred("update_progress_bar", 1)
		await get_tree().create_timer(0.03).timeout

func update_progress_bar(increment):
	pb.value += increment
	
func _on_button_pressed():
	pretend_you_are_loading(50)
	thread.start(pretend_you_are_loading.bind(50))
	pass # Replace with function body.
	
func _exit_tree():
	thread.wait_to_finish()
