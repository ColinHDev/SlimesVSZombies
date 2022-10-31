extends Label
var debuffs = ["Speed:      ", "Strength:   ", "Size:         ", "Amount:    "]
var speed = 1
var strength = 1
var size = 1
var amount = 1
var raise = 0
var rng = RandomNumberGenerator.new()

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		rng.randomize()
		text = (debuffs[0] + String(speed) + "\n" + debuffs[1] + String(strength) + "\n" + debuffs[2] + String(size) + "\n" + debuffs[3] + String(amount))
		raise = rng.randi_range(0, 4)
		
		if raise == 0:
			speed += 1
		if raise == 1:
			strength += 1
		if raise == 2:
			size += 1
		if raise == 3:
			amount += 1
