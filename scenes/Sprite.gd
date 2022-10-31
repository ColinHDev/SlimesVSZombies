extends Sprite

func _on_potion_button_toggled(button_pressed):
	get_parent().get_node("Sprite2").visible = true
