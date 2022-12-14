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
	scale = Vector2(2.0, 2.0)
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
	shoot(slime)
	
onready var bullet = preload("res://scenes/projectile.tscn")

func shoot(slime) -> void:
	var bulletInstance = bullet.instance()
	bulletInstance.position = position
	bulletInstance.setTarget(slime)
	get_parent().add_child(bulletInstance)

func _on_Revive_animation_finished():
	$Revive.visible = false


func _on_Revive_frame_changed():
	if ($Revive.frame == 131):
		$Idle.visible = true
		$Idle.frame = 0
		$Idle.playing = true
