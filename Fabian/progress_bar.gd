extends Node2D

onready var bar = get_node("bar_bg/bar")
onready var durlbl = get_node("bar_bg/duration_label")
export var running = false
export var duration = 5
var dur_begin = duration
export var counter = 60


# Called when the node enters the scene tree for the first time.
func _ready():
	bar.rect_size.y = rect_size.y - rect_size.y * 0.2
	durlbl.rect_size = rect_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_potion_button_pressed():
	pass # Replace with function body.
