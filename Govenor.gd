extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(NodePath) var main
export(Array, NodePath) var subs

func _ready():
	get_node(main).enable(true)
	for subpath in subs:
		get_node(subpath).enable(false)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_enter_room(id):
	get_node(main).enable(false)
	get_node(subs[id]).enable(true)
