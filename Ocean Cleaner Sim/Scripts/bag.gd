extends RigidBody3D

signal bagSizeUpdate
signal bagUpdate

@export var bagSpace = 0
@export var bagLimit = 10

var player
@onready var plop = $plop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Main/XROrigin3D")
	player.connect("pointsHasBeenAdded", Callable(self, "clearBagContents"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_enter_bag_detector_body_entered(body: Node3D) -> void:
	print(body)
	if body.is_in_group("currentTrash") and bagSpace < bagLimit:
		plop.play()
		bagSpace += 1
		body.queue_free()
		emit_signal("bagUpdate")

func updateBag():
	print("Signal has been emitted from bag")
	emit_signal("bagSizeUpdate")

func clearBagContents():
	print("Bag is being emptied")
	bagSpace = 0
	emit_signal("bagUpdate")
