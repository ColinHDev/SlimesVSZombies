extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var slime = preload("res://Colin/Slime.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export var lanes = [100, 200, 300, 400, 500, 600, 700];

var i = 0
var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i += 1
	if i >= 100:
		var slimeInstance = slime.instance()
		rng.randomize()
		slimeInstance.position.x += lanes[rng.randi_range(0, lanes.size() - 1)]
		get_parent().add_child(slimeInstance)
		i = 0
