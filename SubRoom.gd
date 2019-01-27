extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal on_exit_room
signal on_turn(turned)
signal on_enable(enabled)

export (float) var corrupt_rate = -1

func enable(enabled):
    if corrupt_rate >= 0:
        get_node("Bear-03/Area2D").corrupt_rate = corrupt_rate
    visible = enabled;
    emit_signal("on_enable", enabled)

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _door_on_exit():
    print("leaving room")
    emit_signal("on_exit_room")

func _on_bear_turn(turned):
    print("bear turned ", turned)
    emit_signal("on_turn", turned)
