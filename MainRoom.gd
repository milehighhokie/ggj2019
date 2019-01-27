extends Sprite

signal on_enter_room(id)
signal on_enable(enabled)

func enable(enabled):
    visible = enabled;
    emit_signal("on_enable", enabled)

func _ready():
    pass

func _door_on_enter(id):
    print("Door Opened ", id)
    emit_signal("on_enter_room", id)
