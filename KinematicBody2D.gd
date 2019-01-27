extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("icon/AnimationPlayer").play("Stand")
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

export (int) var speed = 200

var velocity = Vector2()
var _enabled = true;
var _walking = false;
var _hugging = false;

func enable(enabled):
	_enabled = enabled
	get_node("CollisionShape2D").enable(enabled)

func get_input():
	velocity = Vector2()
	if _enabled:
		if Input.is_action_pressed('right'):
			velocity.x += 1
		if Input.is_action_pressed('left'):
			velocity.x -= 1
		if Input.is_action_pressed('down'):
			velocity.y += 1
		if Input.is_action_pressed('up'):
			velocity.y -= 1
		if Input.is_action_pressed('hug'):
			velocity = Vector2()
	
	if Input.is_action_pressed("hug") && !_hugging:
		get_node("icon/AnimationPlayer").play("Hug")
	elif !Input.is_action_pressed("hug") && _hugging:
		get_node("icon/AnimationPlayer").play(
			"Walk" if _walking else "Stand")
	_hugging = Input.is_action_pressed("hug")
	
	if !_hugging && velocity.length() > 0.0 && !_walking:
		get_node("icon/AnimationPlayer").play("Walk")
	elif !_hugging && velocity.length() == 0.0 && _walking:
		get_node("icon/AnimationPlayer").play("Stand")
	_walking = velocity.length() > 0.0
	
	if velocity.x < 0.0:
		get_node("icon").scale.x = -1
		get_node("Arm").scale.x = -1
	elif velocity.x > 0.0:
		get_node("icon").scale.x = 1
		get_node("Arm").scale.x = 1
	
	velocity = velocity * speed

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
