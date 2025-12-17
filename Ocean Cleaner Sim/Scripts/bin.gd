extends StaticBody3D

signal addPoints
signal emptyBag

var bag
var multiplier
var multiplierContent

@onready var fire = $Fire

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bag = get_node("/root/Main/BagStatic")
	multiplier = get_node("/root/Main/Stage/UI Wall/Multiplier/Viewport2Din3D/Viewport")
	multiplierContent = multiplier.get_child(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body == bag:
		print("This is the bag yippee")
		fire.play()
		pointAdd()

func pointAdd():
	print("Add points signal")
	emit_signal("addPoints")

func clearBagItems():
	emit_signal("emptyBag")
