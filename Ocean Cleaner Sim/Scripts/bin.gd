extends StaticBody3D

signal addPoints
signal emptyBag

var bag

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bag = get_node("/root/Main/BagStatic")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body == bag:
		print("This is the bag yippee")
		pointAdd()

func pointAdd():
	print("Add points signal")
	emit_signal("addPoints")

func clearBagItems():
	emit_signal("emptyBag")
