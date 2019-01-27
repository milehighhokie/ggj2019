extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var _overlap = false
var _triggered = false

func _ready():
    get_node("../Achievement/AnimationPlayer").play("Stay")
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _process(delta):
    # Called every frame. Delta is time since last frame.
    # Update game logic here.
    if !_triggered && _overlap && Input.is_action_pressed('hug'):
        get_node("../Achievement/AnimationPlayer").play("Popup")
        _triggered = true
    pass

func _on_Area2D_body_entered(body):
    _overlap = true
    pass # replace with function body


func _on_Area2D_body_exited(body):
    _overlap = false
    pass # replace with function body
