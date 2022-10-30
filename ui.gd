extends Node2D

export var potion_count = 0

func _on_potion_button_pressed():
	if (get_node("player_panel/ressource_subpanel/slime_plort").plort_count >= 5):
		potion_count = potion_count + 1
		get_node("player_panel/ressource_subpanel/slime_plort").plort_count -= 5
		get_node("player_panel/potion_subpanel/potion1").text = String(potion_count)
