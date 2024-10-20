extends Node2D

###### 25:15 Semaphores ######

var car1: Thread = Thread.new()
var car2: Thread = Thread.new()
var car3: Thread = Thread.new()

var semaphore: Semaphore = Semaphore.new()

func _ready() -> void:

    # 2 empty places
    semaphore.post()
    semaphore.post()

    car1.start(print_if_allowed.bind(1))
    car2.start(print_if_allowed.bind(2))
    car3.start(print_if_allowed.bind(3))

    car1.wait_to_finish()
    car2.wait_to_finish()
    car3.wait_to_finish()

func print_if_allowed(number):
    semaphore.wait()
    print(str(number) + " is parking")
    var i = 0
    while i < 10000000:
        i += 1
    print(str(number) + " is leaving Parking Spot")
    semaphore.post()