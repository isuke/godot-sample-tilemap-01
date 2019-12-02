extends PhysicsBody2D

export var speed = 400
var screen_size

func _ready():
	hide()
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2(-speed, 0)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play()
	elif Input.is_action_pressed("ui_right"):
		velocity = Vector2(speed, 0)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play()
	else:
		velocity = Vector2(0, 0)
		$AnimatedSprite.stop()

	self.linear_velocity = velocity

	# position.x = clamp(position.x, 0, screen_size.x)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
