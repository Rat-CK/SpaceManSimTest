extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var water = 0
var food = 0
var metals = 0
var energy = 0
var pop = 0
var growing = true

var hour = 0
var day = 0 
var month = 0 
var year = 0

var water_consumption_per_100 = 0.25
var food_consumption_per_100 = 0.3


func _process(delta):
	time(delta)

func time(delta):
		
	hour += 24 * delta
	if(hour >= 24):
		hour = 0 
		day += 1
		print(day)
	#0.1 increase to prevent looping on the following "days"
	if(day == 7):
		growth(delta)
		day += 0.1
	if(day == 14.1):
		growth(delta)
		day += 0.1
	if(day == 21.2):
		growth(delta)
		day += 0.1
	if(day == 28.3):
		growth(delta)
		day += 0.1
	if (day >= 30):
		day = 0
		month += 1
	if (month >= 12):
		month = 0
		year += 1			

#Population , water , food mechanics.
func growth(_delta):
	#population consumption rate per 100 pops , 100 * 0.25 for example.
	var waterconsumption = pop / 100 * water_consumption_per_100
	var foodconsumption = pop / 100 * food_consumption_per_100
	#popgrowth calculation based on prior values
	var popgrowth = waterconsumption + foodconsumption
	#label rounding vars.
	var poplabdec = stepify(pop,0)
	var watlabdec = stepify(water,0)
	var foodlabdec = stepify(food,0)
	
	if growing:
		if pop > 0:
			if water >= waterconsumption and food >= foodconsumption:
				# * 360 because of 360 days in a year , representing a year worth of consumption.
				if water >= waterconsumption * 360 :
					pop += popgrowth
					water -= waterconsumption
					# halved to represent excess in water leads to safer food growth
					food -= (foodconsumption / 2)
					$Pop.text = str(poplabdec)
					$Water.text = str(watlabdec)
					$Food.text = str(foodlabdec)
				# * 30 because of 30 days per month , to represent a month worth of water.
				elif water >= waterconsumption * 7:
					pop += popgrowth
					water -= waterconsumption
					food -= foodconsumption
					$Pop.text = str(poplabdec)
					$Water.text = str(watlabdec)
					$Food.text = str(foodlabdec)
				elif water >= waterconsumption:
					pop += popgrowth
					water -= waterconsumption
					food -= foodconsumption
					$Pop.text = str(poplabdec)
					$Water.text = str(watlabdec)
					$Food.text = str(foodlabdec)
			if water <= waterconsumption or food <= foodconsumption:
				pop -= (pop * 0.2) + 10
				$Pop.text = str(poplabdec)
				$Water.text = str(watlabdec)
				$Food.text = str(foodlabdec)
		if pop < 0:
			print ("dead")
			growing = false
			pop = 0
			$Pop.text = str(poplabdec)
			$Water.text = str(watlabdec)
			$Food.text = str(foodlabdec)




#func _ready():
#	print("DEBUGGY")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
