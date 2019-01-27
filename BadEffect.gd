extends CanvasModulate

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (Color) var target_color
export (float) var change_speed

var _status = 0.0
var _turned = false

func turn(turned):
    _turned = turned

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _process(delta):
    _status += clamp((1 if _turned else 0) - _status,
        -change_speed * delta, change_speed * delta)
    color = Color(1,1,1).linear_interpolate(target_color, _status)
