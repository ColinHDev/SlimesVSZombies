extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Slime = preload("res://Colin/Slime.tscn")

var plort_count = 0
var potion_count = 0

var minX = 400
var maxX = 1200

var i = 0
var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i += 1
	if i >= 100:
		var slimeInstance = Slime.instance()
		rng.randomize()
		slimeInstance.position.x = rng.randi_range(minX, maxX)
		rng.randomize()
		slimeInstance.size = rng.randi_range(1, 4)
		self.add_child(slimeInstance)
		i = 0
