extends Node2D

###### 32:01 Mutex Rendezvous ######

var thread1: Thread = Thread.new()
var thread2: Thread = Thread.new()

var mutex1: Mutex = Mutex.new()
var mutex2: Mutex = Mutex.new()

func _ready() -> void:

    mutex1.lock()
    mutex2.lock()

    thread1.start(th1)
    thread2.start(th2)

    pass

func th1() -> void:
    #...
    mutex1.unlock()
    mutex2.lock()

func th2() -> void:
    var i = 0
    while i < 10000000:
        i += 1
    
    mutex2.unlock()
    mutex1.lock()
