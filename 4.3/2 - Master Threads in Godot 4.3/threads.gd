extends Node2D

###### 36:45 Semaphores Barrier ######

var thread_arr: Array[Thread] = []
var thread_count = 5

var mutex: Mutex = Mutex.new()
var barrier: Semaphore = Semaphore.new()

var count = 0

func _ready() -> void:
	for i in range(thread_count):
		var thread = Thread.new()
		thread_arr.append(thread)
		
	for i in range(thread_count):
		thread_arr[i].start(meeting.bind(i + 1))

	
func meeting(i):
	if i == 3:
		var j = 0
		while j < 10000000:
			j += 1
	mutex.lock()
	count += 1
	if count == thread_count:
		barrier.post()
	mutex.unlock()
	
	barrier.wait()
	barrier.post()
	
	print("Thread number " + str(i) + " has arrived")
	pass
