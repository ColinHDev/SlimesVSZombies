extends KinematicBody2D

var size: int
var speed: float

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
		get_parent().get_parent().reduceLive()
		queue_free()
		return
	position.y += speed

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		split()

func split() -> void:
	if (size > 1):
		get_parent().get_parent().spawnSlime(size - 1, speed, max(position.x - 100, GlobalData.minX), position.y)
		get_parent().get_parent().spawnSlime(size - 1, speed, min(position.x + 100, GlobalData.maxX), position.y)
	else:
		GlobalData.plort_count += 1
	queue_free()
