extends Node2D

func _ready():
	spawnSlimes(1500, 3, 600)

func isGameOver() -> bool:
	return GlobalData.player_lives <= 0

func reduceLive() -> void:
	GlobalData.player_lives -= 1
	if (GlobalData.player_lives == 0):
		$slime_wall.visible = true
		$slime_wall.set_as_toplevel(true)
		$slime_wall.frame = 0
		$slime_wall.playing = true

func _on_slime_wall_animation_finished():
	get_tree().change_scene("res://scenes/death_scene.tscn")

# Adds a spawner to this class, which spawns the given amount of slimes evenly distributed
# across the given time. The slimes have a random size between 1 and the given maxSize
# Returns false if another previously added spawner is still running, otherwise true
func spawnSlimes(number: int, maxSize: int, time: int) -> bool:
	if (spawner != null && spawner.hasFinished() == false):
		return false;
	spawner = load("res://scripts/Spawner.gd").new(number, maxSize, time)
	return true

# Spawns a slime with the given size at the given coordinates
# If a negative y coordinate is given, then a position according to the sprite 
# size above the camera's reach is chosen so that the slime walks into the screen
func spawnSlime(size: int, x: float, y: float) -> void:
	var slimeInstance = preload("res://scenes/Slime.tscn").instance()
	slimeInstance.size = size
	slimeInstance.position.x = x
	slimeInstance.position.y = y
	self.add_child(slimeInstance)

var spawner = null

func _process(delta):
	if isGameOver():
		return
	if spawner != null:
		var toSpawn: int = spawner.getAmountToSpawn()
		while toSpawn > 0:
			spawnSlime(spawner.getRandomSize(), spawner.getRandomX(), -1)
			toSpawn -= 1
