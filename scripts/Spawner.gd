extends Node

var number: int
var numberLeft: int
var maxSize: int
var maxSpeed: float
var maxStrength: float
var time: int
var startTime: int
var lastSpawn: int = 0
var rng: RandomNumberGenerator

func _init(numberOfSlimes: int, slimeMaxSize: int, slimeMaxSpeed: float, slimeMaxStrength: float, timeToSpawn: int):
	number = numberOfSlimes
	numberLeft = numberOfSlimes
	maxSize = slimeMaxSize
	maxSpeed = slimeMaxSpeed
	maxStrength = slimeMaxStrength
	time = timeToSpawn
	startTime = OS.get_system_time_secs()
	rng = RandomNumberGenerator.new()
	rng.randomize()

func hasFinished() -> bool:
	return OS.get_system_time_secs() - startTime > time
	
var tmp: float = 0.0;
func getAmountToSpawn() -> int:
	if hasFinished():
		return 0
	var secondsInCycle = OS.get_system_time_secs() - startTime
	if lastSpawn == secondsInCycle:
		return 0
	lastSpawn = secondsInCycle
	
	var x: float = (float(number) / float(time)) + tmp
	if (x >= 1.0):
		var count: int = int(floor(x))
		tmp = x - float(count)
		numberLeft -= count
		return count
	tmp = x
	return 0
	"""var mean: float = float(number) / 2.0
	var deviation: float = mean / 3.0
	var gaussian: float = gaussian(mean, deviation, x)
	
	for i in range(1, 32):
		gaussian += gaussian(mean, deviation, (float(number) / float(time)) * (float(secondsInCycle) + pow(10, - i)))
	
	print(str(secondsInCycle) + " - " + str(float(secondsInCycle) + pow(10, - 32)))
	print(gaussian)
	print(gaussian * number)
	print(int(round(gaussian * number)))
	return int(round(gaussian * number));"""
	
#func gaussian(mean: float, deviation: float, x: float) -> float:
	#return (1 / (deviation * sqrt(2 * PI))) * pow(exp(1), -0.5 * pow((x - mean) / deviation, 2))

func getRandomSize() -> int:
	return rng.randi_range(1, maxSize)

func getRandomSpeed() -> float:
	return rng.randf_range(0.5, maxSpeed)

func getRandomStrength() -> float:
	return rng.randf_range(1.0, maxStrength)

func getRandomX() -> int:
	return rng.randi_range(GlobalData.minX, GlobalData.maxX)
