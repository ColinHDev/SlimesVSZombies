extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Slime = preload("res://Colin/Slime.tscn")
const laneCount: int = 5
var lanes: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# ToDo: If the window is resized (entering full screen mode), the camera size also changes
	# so all of the following calculations are no longer matching the screen size
	lanes.resize(laneCount)
	var spaceBetweenLanes = (get_viewport_rect().size.x - 400) / (laneCount - 1)
	for i in range(0, laneCount):
		lanes[i] = 200 + spaceBetweenLanes * i

func resizeLanes() -> void:
	var newLanes: Array = []
	newLanes.resize(laneCount)
	var spaceBetweenLanes = (get_viewport_rect().size.x - 400) / (laneCount - 1)
	for i in range(0, laneCount):
		newLanes[i] = 200 + spaceBetweenLanes * i
	for child in get_children():
		if child.get:
			child.position.x = newLanes[child.getLane()]
	lanes = newLanes

var i = 0
var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i += 1
	if i >= 100:
		var slimeInstance = Slime.instance()
		rng.randomize()
		slimeInstance.position.x = lanes[rng.randi_range(0, lanes.size() - 1)]
		rng.randomize()
		slimeInstance.size = rng.randi_range(1, 4)
		self.add_child(slimeInstance)
		i = 0
