extends Area2D

signal on_exit_room

var _overlap = false

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _process(delta):
    # Called every frame. Delta is time since last frame.
    # Update game logic here.
    if _overlap && Input.is_action_pressed('left'):
        emit_signal("on_exit_room")
    pass

func _on_Area2D_body_entered(body):
    _overlap = true

func _on_Area2D_body_exited(body):
    _overlap = false

#func _on_Area2D_on_exit_room():
#    get_tree().change_scene("res://Main.tscn")
