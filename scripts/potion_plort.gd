extends Label

onready var progress_bar = get_node("../progress_bar")
onready var progress_bar_progress = get_node("../progress_bar_progress")
onready var durlbl = get_node("../duration_label")
export var running = false
export var duration = 5
var dur_begin = duration
export var counter = 60

func _ready():
	text = "0"
	progress_bar_progress.rect_size.y = progress_bar.rect_size.y * 0.8
	durlbl.rect_size = progress_bar.rect_size
	
func _process(delta):
	text = String(text.to_int() + 1)
	text = String(Game.potion_count)
	
	if running:
		counter -= 1
		progress_bar_progress.rect_size.x += delta * ((progress_bar.rect_size.x * 0.95) / dur_begin)
		
	if counter <= 0:
		duration -= 1
		counter = 60
		durlbl.text = "0:0" + String(duration)
		
	if progress_bar_progress.rect_size.x >= progress_bar.rect_size.x * 0.95:
		progress_bar_progress.rect_size.x = 0
		duration = 5
		durlbl.text = "0:0" + String(duration)
		running = false
		Game.potion_count += 1

func _on_potion_button_pressed():
	if !running and Game.plort_count >= 5:
		running = true
		Game.plort_count -= 5
