extends Label

func _ready():
	text = "0"
	
func _process(delta):
	text = String(text.to_int() + 1)
	text = String(Game.potion_count)

func _on_potion_button_pressed():
	print(Game.plort_count)
	if (Game.plort_count >= 5):
		Game.potion_count = Game.potion_count + 1
		Game.plort_count -= 5
