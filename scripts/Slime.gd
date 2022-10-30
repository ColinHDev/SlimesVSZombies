extends KinematicBody2D

var size = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.scale.x = size * 4
	$AnimatedSprite.scale.y = size * 4
	
	if position.y < 0:
		var height: int = $AnimatedSprite.frames.get_frame($AnimatedSprite.animation, $AnimatedSprite.frame).get_height()
		position.y = 0 - (height * $AnimatedSprite.scale.x) / 2

func _process(delta) -> void:
	for i in range(0, $AnimatedSprite.frames.get_frame_count($AnimatedSprite.animation)):
		var collisionFrame: CollisionPolygon2D = get_node("CollisionFrame" + str(i))
		if i == $AnimatedSprite.frame:
			collisionFrame.disabled = false
			collisionFrame.scale.x = $AnimatedSprite.scale.x
			collisionFrame.scale.y = $AnimatedSprite.scale.y
		else:
			collisionFrame.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var height: int = $AnimatedSprite.frames.get_frame($AnimatedSprite.animation, $AnimatedSprite.frame).get_height()
	if (position.y - (height * $AnimatedSprite.scale.x) / 2 >= get_viewport_rect().end.y):
		Game.player_lives -= 1
		if Game.player_lives <= 0:
			print("Game Over")
		queue_free()
		return
	position.y += 1

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		split()

func split() -> void:
	if (size > 1):
		Game.spawnSlime(size - 1, max(position.x - 100, Game.minX), position.y)
		Game.spawnSlime(size - 1, min(position.x + 100, Game.maxX), position.y)
	else:
		Game.plort_count += 1
	queue_free()
