extends Node2D

@onready var result: Food = $Result
@onready var recipe = $Ingredients

const VEGETABLE_TRAY = preload("res://assets/food/vegetable/vegetable_tray.png")
const TURNIP = preload("res://assets/food/vegetable/turnip.png")
const DINNER_PLATE = preload("res://assets/food/misc/dinner_plate.png")
var ingredients: Array = []

var X = [1, 2, 3]
var Y = [4, 5, 6]

func _ready():
	for child in recipe.get_children():
		var ingredient: Food = child
		ingredients.append([ingredient.naming, ingredient.type])
		
	print(append2(X, Y))
	
func _on_button_button_down():
	
	match ingredients:
		[]:
			print("Empty Array")
		[
			["potato", _],
			["potato", _],
			["potato", _],
			[_, Food.FOOD_TYPE.MEAT]
		]:
			result.ingredient = DINNER_PLATE
		[..] when is_amount_of(Food.FOOD_TYPE.VEGETABLE, 4):
			result.ingredient = VEGETABLE_TRAY
		[..]:
			result.ingredient = TURNIP
			
	result.update_texture()

func is_amount_of(type: Food.FOOD_TYPE, number: int):
	var ingredients_of_type = ingredients.filter(
		func(ingredient):
			return ingredient[1] == type
	).size()
	return ingredients_of_type == number



#append2([], L2, L2).
#append2([H|T], L2, [H|TailR]) :- append(T, L2, TailR).

func append2(arr1, arr2):
	match arr1:
		[]: 
			return arr2  
		[var head, ..]: 
			
			var tail = arr1.slice(1, arr1.size())
			var result = append2(tail, arr2)
			return [head] + result 
			










func list_sum(arr, current_sum = 0):
	match arr:
		[]:
			return current_sum
		[var head, ..] when typeof(head) == TYPE_INT || typeof(head) == TYPE_FLOAT:
			var tail = arr.slice(1, arr.size())  
			print("Current sum: ", current_sum)
			
			print(list_sum(tail, current_sum + head))
			return list_sum(tail, current_sum + head)  
		[var head, ..]:
			var tail = arr.slice(1, arr.size()) 
			return list_sum(tail, current_sum)
