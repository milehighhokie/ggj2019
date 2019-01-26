extends Area2D

signal on_enter;

var _overlap = false;

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
    #
    pass

func _process(delta):
    # Called every frame. Delta is time since last frame.
    # Update game logic here.
    if _overlap && Input.is_action_just_pressed('up'):
        #get_tree().change_scene("res://SubRoom.tscn")
        emit_signal("on_enter")
    pass

func _on_Area2D_body_entered(body):
	_overlap = true

func _on_Area2D_body_exited(body):
	_overlap = false