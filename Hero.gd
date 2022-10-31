extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var rng = RandomNumberGenerator.new()
var i = 0
var posX = 0;
var posY = 0;
export var runningSpawn = false
var spawnCounter = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta) -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#	i+=1
#	if i > 100:
#		i = 0
#		rng.randomize()
#		posX = GlobalData.minX+rng.randi_range(0, GlobalData.maxX-GlobalData.minX)
#		rng.randomize()
#		posY = GlobalData.minY+rng.randi_range(0, GlobalData.maxY-GlobalData.minY)


func _on_Button_pressed():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	posX = GlobalData.minX+rng.randi_range(0, GlobalData.maxX-GlobalData.minX)
	rng.randomize()
	posY = GlobalData.minY+rng.randi_range(0, GlobalData.maxY-GlobalData.minY)
	get_parent().spawnHero(posX,posY)
