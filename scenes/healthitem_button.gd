extends Button


func _pressed():
	if (GlobalData.plort_count >= 5):
		GlobalData.player_lives += 1
		GlobalData.plort_count -= 5
