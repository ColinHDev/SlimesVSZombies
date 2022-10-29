extends Label

export var plort_count = 0

func _ready():
	text = "0"
	
func _process(delta):
	text = String(plort_count)


func _on_Button_pressed():
	plort_count = plort_count + 1
