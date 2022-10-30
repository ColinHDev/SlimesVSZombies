extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Schleimwand2.frame = 0
	$Schleimwand2.playing = true
	$Game_over_blink.frame = 0
	$Game_over_blink.playing = false
	$Game_over_blink.visible = false

func _on_Schleimwand2_animation_finished():
	get_tree().change_scene("res://scenes/death_scene.tscn")
