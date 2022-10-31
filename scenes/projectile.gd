extends KinematicBody2D

var slime: WeakRef

func _ready():
	scale = Vector2(2.0, 2.0)

func setTarget(target: KinematicBody2D):
	slime = weakref(target)

func _physics_process(delta):
	var slimeInstance: KinematicBody2D = slime.get_ref()
	if slimeInstance == null:
		queue_free()
		return
	look_at(slimeInstance.position)
	rotate((90 * PI) / 180)
	var vectorToMove: Vector2 = (slimeInstance.position - position).limit_length(4.0)
	var collision: KinematicCollision2D = move_and_collide(vectorToMove, true, true, true)
	if (collision != null && slimeInstance.get_instance_id() == collision.collider_id):
		slimeInstance.split()
		queue_free()
	else:
		position += vectorToMove
