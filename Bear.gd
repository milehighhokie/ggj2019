extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal on_turn(turned)

export var corrupt_rate = 0.1
export var recharge_rate = 1.0
export (NodePath) var status_node
export (Texture) var good_texture
export (Texture) var bad_texture

var _status = 1.0
var _overlap = false
var _turned = false

func _ready():
    
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _process(delta):
    # Called every frame. Delta is time since last frame.
    # Update game logic here.
    if _overlap && Input.is_action_pressed('hug'):
        _status = min(_status + recharge_rate * delta, 1.0)
        if _turned:
            get_parent().texture = good_texture
            emit_signal("on_turn", false)
            _turned = false
    else:
        _status = max(_status - corrupt_rate * delta, 0.0)
        if !_turned && _status == 0:
            get_parent().texture = bad_texture
            emit_signal("on_turn", true)
            _turned = true
        
    get_node(status_node).scale = Vector2(1, _status)
    pass


func _on_Area2D_body_entered(body):
    _overlap = true
    pass # replace with function body


func _on_Area2D_body_exited(body):
    _overlap = false
    pass # replace with function body
