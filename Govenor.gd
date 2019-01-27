extends Node2D

export(NodePath) var main
export(Array, NodePath) var subs

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