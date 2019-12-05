extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 200
const JUMP_SPEED = 270

var velocity = Vector2()

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

###

func _ready():
	hide()

func _physics_process(delta):
	_move(delta)

func _process(delta):
	_play_walk_animation()

###

func _move(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	if Input.is_action_pressed("jump") && is_on_floor():
		velocity.y = -JUMP_SPEED

	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

	# The second parameter of "move_and_slide" is the normal pointing up.
	# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	move_and_slide(velocity, Vector2(0, -1))

func _play_walk_animation():
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play()
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
