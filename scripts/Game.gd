extends Node2D

func isGameOver() -> bool:
	return GlobalData.player_lives <= 0

func reduceLive(amount: int) -> void:
	GlobalData.player_lives -= amount
	if (GlobalData.player_lives <= 0 and GlobalData.player_lives + amount > 0):
		$slime_wall.visible = true
		$slime_wall.set_as_toplevel(true)
		$slime_wall.frame = 0
		$slime_wall.playing = true

func _on_slime_wall_animation_finished():
	get_tree().change_scene("res://scenes/death_scene.tscn")

# Adds a spawner to this class, which spawns the given amount of slimes evenly distributed
# across the given time. The slimes have a random size between 1 and the given maxSize
# and a random speed between 0.5 and maxSpeed
# Returns false if another previously added spawner is still running, otherwise true
func spawnSlimes(number: int, maxSize: int, maxSpeed: float, maxStrength: float, time: int) -> bool:
	if (getRemainingSlimeNumber() > 0):
		return false;
	spawner = load("res://scripts/Spawner.gd").new(number, maxSize, maxSpeed, maxStrength, time)
	return true

onready var slime = preload("res://scenes/Slime.tscn")

# Spawns a slime with the given size, speed and strength at the given coordinates
# If a negative y coordinate is given, then a position according to the sprite 
# size above the camera's reach is chosen so that the slime walks into the screen
func spawnSlime(size: int, speed: float, strength: float, x: float, y: float) -> void:
	var slimeInstance = slime.instance()
	slimeInstance.size = size
	slimeInstance.speed = speed
	slimeInstance.strength = strength
	slimeInstance.position.x = x
	slimeInstance.position.y = y
	$SlimeContainer.add_child(slimeInstance)

var spawner = null

func _process(delta):
	if isGameOver():
		return
	if (spawner != null && spawner.hasFinished() == false):
		var toSpawn: int = spawner.getAmountToSpawn()
		while toSpawn > 0:
			spawnSlime(spawner.getRandomSize(), spawner.getRandomSpeed(), spawner.getRandomStrength(), spawner.getRandomX(), -1)
			toSpawn -= 1
			
	if (spawner != null and getRemainingSlimeNumber() <= 0):
		spawner = null
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		match(rng.randi_range(0, 3)):
			0:
				if maxSize < 4:
					maxSize += 1
				else:
					maxStrength = min(maxStrength + 0.1, 3.0)
			1:
				maxSpeed = min(maxSpeed + 0.1, 3.0)
			2:
				maxStrength = min(maxStrength + 0.1, 3.0)
			3:
				amount = int(round(amount * 1.1))
		time += 1

var waveCount: int = 0

# Returns how many slimes are on the scene and still need to be spawned
func getRemainingSlimeNumber() -> int:
	var remainingSlime: int = $SlimeContainer.get_child_count()
	if (spawner != null and !spawner.hasFinished()):
		remainingSlime += spawner.numberLeft
	return remainingSlime

var maxSize: int = 2
var maxSpeed: float = 1.2
var maxStrength: float = 1.0
var amount: int = 10
var time: int = 10

func _on_next_wave_button_pressed():
	if spawnSlimes(amount, maxSize, maxSpeed, maxStrength, time):
		waveCount += 1
