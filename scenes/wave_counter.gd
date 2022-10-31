extends Label
func _ready():
	text = "         " +  str(get_parent().getWaveCount()) + "\n\n         " + str(get_parent().getRemainingSlimeNumber())

func _process(delta):
	text = "         " +  str(get_parent().getWaveCount()) + "\n\n         " + str(get_parent().getRemainingSlimeNumber())
