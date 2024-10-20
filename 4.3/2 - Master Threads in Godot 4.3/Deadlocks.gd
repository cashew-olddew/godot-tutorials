extends Node2D

###### 28:28 Deadlocks ######

var thread1: Thread = Thread.new()
var thread2: Thread = Thread.new()

var mutex1: Mutex = Mutex.new()
var mutex2: Mutex = Mutex.new()

func _ready() -> void:

    thread1.start(th1)
    thread2.start(th2)

    pass

func th1():
    mutex1.lock()
    print("Thread 1 locked mutex 1")

    var i = 0
    while i < 100000:
        i = i + 1

    mutex2.lock()
    print("Thread1 locked mutex 2")

    mutex2.unlock()
    mutex1.lock()

func th2():
    mutex2.lock()
    print("Thread 2 locked mutex 2")

    mutex1.lock()
    print("Thread 2 locked mutex 1")

    mutex1.unlock()
    mutex2.unlock()