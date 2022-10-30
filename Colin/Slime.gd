extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var size = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.scale.x = size * 4
	$AnimatedSprite.scale.y = size * 4
	
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
	if (position.y >= get_viewport_rect().end.y):
		Game.player_lives -= 1
		if Game.player_lives <= 0:
			print("Game Over")
		queue_free()
		return
	var collision: KinematicCollision2D = move_and_collide(Vector2(0.0, 1.0), true, true, true)
	if collision == null || collision.collider_id < get_instance_id():
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
