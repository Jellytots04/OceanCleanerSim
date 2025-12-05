extends XROrigin3D

signal pointsHasBeenAdded
signal updatePointCount

@export var points = 0

var bin
var bag

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bag = get_node("/root/Main/BagStatic")
	bin = get_node("/root/Main/Stage/TrashBin")
	bin.connect("addPoints", Callable(self, "increasePointCount"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func increasePointCount():
	print("Receive points connect")
	points += bag.bagSpace
	emit_signal("pointsHasBeenAdded")
	emit_signal("updatePointCount")
