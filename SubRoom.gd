extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal on_exit_room
signal on_enable(enabled)

func enable(enabled):
    visible = enabled;
    emit_signal("on_enable", enabled)

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _door_on_exit():
    print("leaving room ")
    emit_signal("on_exit_room")