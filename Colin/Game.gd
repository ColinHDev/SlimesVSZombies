extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Slime = preload("res://Colin/Slime.tscn")

func _ready():
	spawnSlimes(10, 2, 40)

var plort_count = 0
var potion_count = 0
var heal_count = 0
var player_lives = 3

var minX = 400
var maxX = 1200

func spawnSlimes(number: int, maxSize: int, time: int) -> bool:
	if (spawner != null):
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
