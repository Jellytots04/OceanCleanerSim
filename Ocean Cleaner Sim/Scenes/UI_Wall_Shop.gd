extends StaticBody3D

var viewport_scene
var player

signal increaseBagSize
signal increaseSpongeSize
signal increasePlayerSpeed
signal increaseTrashLimit
signal increaseSpillLimit
signal increasePriceOfTrash

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Main/XROrigin3D")
	print("From the UI Wall Script : ", player)
	viewport_scene = $Shop/ShopViewPort/Viewport.get_child(0) # Locate the margin container holding the items
	# print(viewport_scene)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
