extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(Vector2(0.0, 1.0))

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		var currentFrame = $AnimatedSprite.frames.get_frame($AnimatedSprite.animation, $AnimatedSprite.frame)
		var minX = position.x - (currentFrame.get_width() * scale.x)
		var minY = position.y - (currentFrame.get_height() * scale.y)
		var maxX = position.x + (currentFrame.get_width() * scale.x)
		var maxY = position.y + (currentFrame.get_height() * scale.y)
		if event.position.x >= minX and event.position.x <= maxX and event.position.y >= minY and event.position.y <= maxY:
			queue_free()
