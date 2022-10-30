extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Slime = preload("res://Colin/Slime.tscn")

func _ready():
	spawnSlimes(1500, 3, 600)

var plort_count = 0
var potion_count = 0
var heal_count = 0
var player_lives = 3

var minX = 400
var maxX = 1200

# Adds a spawner to this class, which spawns the given amount of slimes evenly distributed
# across the given time. The slimes have a random size between 1 and the given maxSize
# Returns false if another previously added spawner is still running, otherwise true
func spawnSlimes(number: int, maxSize: int, time: int) -> bool:
	if (spawner != null && spawner.hasFinished() == false):
		return false;
	spawner = load("res://Colin/Spawner.gd").new(number, maxSize, time)
	return true

# Spawns a slime with the given size at the given coordinates
func spawnSlime(size: int, x: float, y: float) -> void:
	var slimeInstance = Slime.instance()
	slimeInstance.size = size
	slimeInstance.position.x = x
	slimeInstance.position.y = y
	self.add_child(slimeInstance)

var spawner = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawner != null:
		var toSpawn: int = spawner.getAmountToSpawn()
		while toSpawn > 0:
			spawnSlime(spawner.getRandomSize(), spawner.getRandomX(), 100.0)
			toSpawn -= 1
