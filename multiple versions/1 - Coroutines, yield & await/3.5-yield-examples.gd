# Waiting for a signal
yield(some_button, "button_up")

# Waiting for some time to pass
yield(get_tree().create_timer(2.0), "timeout")

# Waiting for animations to finish
onready var ap = $AnimationPlayer
func play_animations():
    ap.play("anim1")
    yield(ap, "animation_finished")
    ap.play("anim2")
    yield(ap, "animation_finished")

# Making asynchronous functions
func _ready():
    check_pressed() # Use yield() to synchronize
    print(3)

func check_pressed():
    print(1)
    yield(some_button, "button_up")
    print(2)

# Prints:
# 1
# 3
# 2