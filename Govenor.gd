extends Node2D

export(NodePath) var main
export(Array, NodePath) var subs

var _turned = 0

func _ready():
    get_node(main).enable(true)
    for subpath in subs:
        get_node(subpath).enable(false)
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _on_enter_room(id):
    get_node(main).enable(false)
    get_node(subs[id]).enable(true)

func _on_exit_room():
    get_node(main).enable(true)
    for subpath in subs:
        get_node(subpath).enable(false)

func _on_bear_turn(turned):
	if turned:
		if _turned == 0:
			get_node("CanvasModulate").turn(true)
			get_node("TimerLabel").set_pause(true)
		_turned += 1
	else:
		_turned -= 1
		if _turned == 0:
			get_node("CanvasModulate").turn(false)
			get_node("TimerLabel").set_pause(false)
		
	
