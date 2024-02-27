# Waiting for a signal
await some_button.button_up

# Waiting for some time to pass
await get_tree().create_timer(2.0).timeout

# Waiting for animations to finish
@onready var ap: AnimationPlayer = $AnimationPlayer
func play_animations():
    ap.play("anim1")
    await ap.animation_finished("anim1")
    ap.play("anim2")
    await ap.animation_finished("anim2")

# Making asynchronous functions
func _ready():
    check_pressed() # Use await to synchronize
    print(3)

func check_pressed():
    print(1)
    await some_button.button_up
    print(2)

# Prints:
# 1
# 3
# 2