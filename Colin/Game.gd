extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var slime = preload("res://Colin/Slime.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var lanes = [100, 200, 300, 400, 500, 600, 700];

var i = 0
var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i += 1
	if i >= 100:
		var slimeInstance = slime.instance()
		rng.randomize()
		slimeInstance.position.x += lanes[rng.randi_range(0, lanes.size() - 1)]
		self.add_child(slimeInstance)
		i = 0

func child_exiting_tree(node: Node):
	if node.get_filename() == slime.instance().get_filename():
		if (node.size > 1):
			var slimeInstance1 = slime.instance()
			slimeInstance1.size = node.size - 1;
			slimeInstance1.position.y = node.position.y
			var slimeInstance2 = slimeInstance1.duplicate()
			
			slimeInstance1.position.x = max(node.position.x - 100, lanes[0])
			slimeInstance2.position.x = min(node.position.x + 100, lanes[lanes.size() - 1])
			
			self.add_child(slimeInstance1)
			self.add_child(slimeInstance2)
