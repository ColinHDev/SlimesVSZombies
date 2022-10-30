extends Node2D

onready var scene = preload("test.tscn")

func _ready():
	pass
	
func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		add_child(scene.instance())
