extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var size = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.scale.x = size * 4
	$AnimatedSprite.scale.y = size * 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (position.y >= get_viewport_rect().end.y):
		queue_free()
		return
	position.y += 1

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		var currentFrame = $AnimatedSprite.frames.get_frame($AnimatedSprite.animation, $AnimatedSprite.frame)
		var minX = position.x - (currentFrame.get_width() * scale.x)
		var minY = position.y - (currentFrame.get_height() * scale.y)
		var maxX = position.x + (currentFrame.get_width() * scale.x)
		var maxY = position.y + (currentFrame.get_height() * scale.y)
		if event.position.x >= minX and event.position.x <= maxX and event.position.y >= minY and event.position.y <= maxY:
			split()

func split() -> void:
	if (size > 1):
		var slimeInstance1 = Game.Slime.instance()
		slimeInstance1.size = size - 1;
		slimeInstance1.position.y = position.y
		var slimeInstance2 = slimeInstance1.duplicate()
		
		slimeInstance1.position.x = max(position.x - 100, Game.minX)
		slimeInstance2.position.x = min(position.x + 100, Game.maxX)
		
		Game.add_child(slimeInstance1)
		Game.add_child(slimeInstance2)
	else:
		Game.plort_count += 1
		print(Game.plort_count)
	queue_free()
