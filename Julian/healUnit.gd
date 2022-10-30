extends Label


func _ready():
	text = "0"
	
func _process(delta):
	text = String(text.to_int() + 1)
	text = String(Game.heal_count)

func _on_heal_button_pressed():
	print(Game.potion_count)
	if (Game.potion_count >= 1):
		Game.heal_count = Game.heal_count + 1
		Game.potion_count -= 1
