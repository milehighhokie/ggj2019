extends Area2D

signal on_exit_room

export (float) var timer = 1.0

var _overlap = false
var _timer = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
    pass

func _process(delta):
	    # Called every frame. Delta is time since last frame.
	    # Update game logic here.
	if _overlap && Input.is_action_pressed('right'):
		_timer += delta
		if (_timer >= timer):
			emit_signal("on_exit_room")
	else:
		_timer = 0
	pass

func _on_Area2D_body_entered(body):
	_overlap = true

func _on_Area2D_body_exited(body):
	_overlap = false

#func _on_Area2D_on_exit_room():
#	get_tree().change_scene("res://Main.tscn")
