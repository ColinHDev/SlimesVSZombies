extends Label

func _ready():
	text = "0"
	
func _process(delta):
	text = String(text.to_int() + 1)
	text = String(Game.plort_count)
	

func _on_plort_button_pressed():
	Game.plort_count = Game.plort_count + 1
