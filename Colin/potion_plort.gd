extends Label

func _on_potion_button_pressed():
	print(Game.plort_count)
	if (Game.plort_count >= 5):
		Game.potion_count = Game.potion_count + 1
		Game.plort_count -= 5
		Game.get_node("player_panel/potion_subpanel/potion1").text = String(Game.potion_count)
