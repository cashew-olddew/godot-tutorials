extends Node2D

###### 13:15 Race Conditions 2 ######

var thread: Thread = Thread.new()
var x := 0

func _ready() -> void:

	thread.strat(increment)

	thread.wait_to_finish()

func use_magic():
	while x < 10:
		x += 1
		if x == 5:
			await get_tree().create_timer(0.1).timeout
			x = x * 2

## First mutex usage try:

# func use_magic():
# 	while x < 10:
# 		x += 1
# 		mutex.lock()
# 		if x == 5:
# 			await get_tree().create_timer(0.1).timeout
# 			x = x * 2
# 		mutex.unlock()

## Second mutex usage try:

# func use_magic():
# 	while x < 10:
# 		mutex.lock()
# 		x += 1
# 		if x == 5:
# 			await get_tree().create_timer(0.1).timeout
# 			x = x * 2
# 		mutex.unlock()

## Third mutex usage try:

# func use_magic():
# 	mutex.lock()
# 	while x < 10:
# 		x += 1
# 		if x == 5:
# 			await get_tree().create_timer(0.1).timeout
# 			x = x * 2
# 	mutex.unlock()

func _exit_tree():
	thread.wait_to_finish()
