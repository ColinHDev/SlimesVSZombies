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
	$Idle.visible = false
	$Revive.visible = true
	$Revive.frame = 0
	$Revive.playing = true

func _process(delta) -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#pass

func _on_Button_pressed():
	if GlobalData.potion_count >=1:
		GlobalData.potion_count -= 1
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		posX = GlobalData.minX+rng.randi_range(0, GlobalData.maxX-GlobalData.minX)
		rng.randomize()
		posY = GlobalData.minY+rng.randi_range(0, GlobalData.maxY-GlobalData.minY)
		get_parent().get_parent().spawnHero(posX,posY)

func _on_Revive_animation_finished():
	$Revive.visible = false


func _on_Revive_frame_changed():
	if ($Revive.frame == 131):
		$Idle.visible = true
		$Idle.frame = 0
		$Idle.playing = true
