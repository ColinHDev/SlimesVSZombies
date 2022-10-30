extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Slime = preload("res://Colin/Slime.tscn")

var plort_count = 0
var potion_count = 0

var minX = 400
var maxX = 1200

# Spawns a slime with the given size at the given coordinates
func spawnSlime(size: int, x: float, y: float) -> void:
	var slimeInstance = Slime.instance()
	slimeInstance.size = size
	slimeInstance.position.x = x
	slimeInstance.position.y = y
	self.add_child(slimeInstance)

var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
