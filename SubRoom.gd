extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal on_exit_room
signal on_turn(turned)
signal on_enable(enabled)

func enable(enabled):
    visible = enabled;
    emit_signal("on_enable", enabled)
    get_node("Achievement/AnimationPlayer").play("Stay")

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
