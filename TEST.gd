extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var water = 10
var food = 10
var metals = 0
var energy = 0
var pop = 5000
var growing = true

var hour = 0
var day = 0 
var week = 0
var month = 0 
var year = 0

var water_consumption_per_100 = 0.25
var food_consumption_per_100 = 0.3


func _process(delta):
	time(delta)

	
	
func time(delta):
		
	hour += 7
	if(hour >= 24):
		hour = 0 
		day += 1 
	if (day >= 7):
		day = 0
		week += 1
		growth(delta)
		if growing:
			print(pop)
	if (week >= 4):
		week = 0
		month += 1
	if (month >= 12):
		month = 0
		year += 1			

	
func growth(_delta):
	var waterconsumption = pop / 100 * water_consumption_per_100
	var foodconsumption = pop / 100 * food_consumption_per_100
	
	if growing:
		if pop > 0:
			if water >= waterconsumption and food >= foodconsumption:
				pop += 100
				water -= waterconsumption
				food -= foodconsumption
			if water <= waterconsumption or food <= foodconsumption:
				pop -= 1000
		if pop < 0:
			print ("dead")
			growing = false
			pop = 0




#func _ready():
#	print("DEBUGGY")
	
	
#func _process(delta):
#	if  water == 0:
#		print("Water Zero")
#		water += 1
#	else:
#		print("Water One")
#		water -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
