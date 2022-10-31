extends Panel

func _on_button_pressed():
	if GlobalData.potion_count >=1:
		GlobalData.potion_count -= 1
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var x: float = rng.randi_range(GlobalData.minX, GlobalData.maxX)
		rng.randomize()
		var y: float = rng.randi_range(GlobalData.minY, GlobalData.maxY)
		get_parent().get_parent().spawnHero(x, y)
