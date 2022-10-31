extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Blinking.visible = false
	$Loading.visible = true
	$Loading.frame = 0
	$Loading.playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Loading.frame == 9:
		$Loading.visible = true
		$Blinking.playing = true
		$Blinking.visible = true
