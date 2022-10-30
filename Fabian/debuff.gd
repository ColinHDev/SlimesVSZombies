extends Label
var debuffs = ["test1", "Enemies spawn faster"]
var rng = RandomNumberGenerator.new()

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		rng.randomize()
		text = debuffs[rng.randf_range(0, 2)]
