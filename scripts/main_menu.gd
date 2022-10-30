extends Node2D

func _ready():
	GlobalData.reset()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Game.tscn")
