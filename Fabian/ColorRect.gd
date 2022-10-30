extends ColorRect

onready var bar = get_node("bar")
onready var durlbl = get_node("duration_label")
export var running = false
export var duration = 5
var dur_begin = duration
export var counter = 60

func _ready():
	bar.rect_size.y = rect_size.y - rect_size.y * 0.2
	durlbl.rect_size = rect_size

func _process(delta):	
	if Input.is_key_pressed(KEY_SPACE):
		running = true
		
	if running:
		counter -= 1
		bar.rect_size.x += delta * ((rect_size.x * 0.95) / dur_begin)
		
	if counter <= 0:
		duration -= 1
		counter = 60
		durlbl.text = "0:0" + String(duration)
		
	if bar.rect_size.x >= (rect_size.x - rect_size.x * 0.05):
		bar.rect_size.x = 0
		duration = 5
		durlbl.text = "0:0" + String(duration)
		running = false
