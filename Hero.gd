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
var lastShot: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Idle.visible = false
	$Revive.visible = true
	$Revive.frame = 0
	$Revive.playing = true

func _physics_process(delta):
	if $Revive.visible:
		return
	if lastShot + 5 > OS.get_system_time_secs():
		return
	var slime = get_parent().get_parent().findNearestSlime(position)
	if (slime == null):
		return
	lastShot = OS.get_system_time_secs()
	slime.split()

onready var bullet = preload("")

func shoot(slime) -> void:
	

func _on_Revive_animation_finished():
	$Revive.visible = false


func _on_Revive_frame_changed():
	if ($Revive.frame == 131):
		$Idle.visible = true
		$Idle.frame = 0
		$Idle.playing = true
