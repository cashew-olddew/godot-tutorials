extends Node2D

var numbers = [1, -1]

func _ready():
	#match numbers:
		#[var x, var y] when x == y:
			#print("numbers are equal")
		#[var x, var y] when x == -y:
			#print("numbers are opposites")
	
	
	#match x:
		#1, 2, 3, 4, 5: print("Work day")
		#6, 7: print("weekend")
	
	
	#match x:
		#{}: print("Empty dictionaty")
		#{"name": "Tim"}: print("Yep, this is Tim")
		#{"name": "Cashew", "favorite_food": "peanuts"}: print("Oh no..")
		#{"name": "Cashew", "favorite_food": var food}: print("I like ", food)
		#{"name", "favorite_food"}: print("I am someone and I like food")
		#{"name", ..}: print("I am someone and I might like food")
	
	#match x:
		#[]: print("empty")
		#[1, 2, 3, 4]: print("Exact match")
		#[var first, _, 3, 4]: print("matched ", first, " and 4 at the end")
		#[_, _, _, 4]: print("matched 4 at the end")
		#[1, 2, ..]: print("Starts with 1 and 2")
	pass
