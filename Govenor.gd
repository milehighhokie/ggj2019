extends Node2D

export(NodePath) var main
export(Array, NodePath) var subs

var _turned = 0

func _ready():
    get_node(main).enable(true)
    for subpath in subs:
        get_node(subpath).enable(false)
    get_node("Art Assets_Sister/Ending Anim").play("Idle")
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

func _on_Timer_timeout():
    get_node("TimerLabel").visible = false
    get_node("CanvasModulate").disable()
    get_tree().call_group("Player", "enable", false)
    get_node("Art Assets_Sister/Ending Anim").play("Ending-First")
    pass # replace with function body

func _on_Ending_Anim_animation_finished(anim_name):
    if anim_name == "Ending-First":
        get_node(main).enable(false)
        for subpath in subs:
            get_node(subpath).enable(false)
        get_node(main).visible = true
        get_node(main).hide_boy()
        get_node("Art Assets_Sister/Ending Anim").play("Ending")
    elif anim_name == "Ending":
        get_tree().change_scene("res://Title.tscn")
    pass # replace with function body
