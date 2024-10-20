extends Node2D

###### 10:11 Race Conditions ######

var thread1: Thread = Thread.new()
var thread2: Thread = Thread.new()
var x := 0

func _ready() -> void:

	thread1.strat(increment)
	thread2.strat(increment)

	thread1.wait_to_finish()
	thread2.wait_to_finish()

func increment():
	while x < 10:
		x = x + 1

func _exit_tree():
	thread1.wait_to_finish()
