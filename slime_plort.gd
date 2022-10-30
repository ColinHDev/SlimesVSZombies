extends Label

export var plort_count = 0

func _ready():
	text = "0"
	
func _process(delta):
	text = String(text.to_int() + 1)
	text = String(plort_count)
	

func _on_plort_button_pressed():
	plort_count = plort_count + 1
