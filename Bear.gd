extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var corrupt_rate = 0.1
export var recharge_rate = 1.0
export(NodePath) var status_node

var _status = 1.0;
var _overlap = false;

func _ready():
	
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if _overlap && Input.is_action_pressed('hug'):
		_status = min(_status + recharge_rate * delta, 1.0)
	else:
		_status = max(_status - corrupt_rate * delta, 0.0)
	print("Bear Status: ", _status)
	get_node(status_node).scale = Vector2(1, _status)
	pass


func _on_Area2D_body_entered(body):
	_overlap = true
	pass # replace with function body


func _on_Area2D_body_exited(body):
	_overlap = false
	pass # replace with function body
