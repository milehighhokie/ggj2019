extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _process(delta):
    var timer = get_node("Timer")
    var time = int(ceil(timer.time_left))
    text = "%d:%02d" % [floor(time / 60), (time % 60)]

func set_pause(pause):
    get_node("Timer").paused = pause
