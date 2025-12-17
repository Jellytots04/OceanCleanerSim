extends XROrigin3D

signal pointsHasBeenAdded
signal updatePointCount
signal updateHealthBar

@export var points = 9999
@export var healthMax = 250
@export var health = 200

var bin
var sponge
var bag
var shop
var multiplier

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bag = get_node("/root/Main/BagStatic")
	bin = get_node("/root/Main/Stage/TrashBin")
	bin.connect("addPoints", Callable(self, "increasePointCount"))
	shop = get_node("/root/Main/Stage/UI Wall")
	shop.connect("requestPoints", Callable(self, "returnPointCount"))
	multiplier = get_node("/root/Main/Stage/UI Wall/Multiplier")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func increasePointCount():
	print("Receive points connect")
	points += int(ceil(bag.bagSpace * multiplier.currrentMultiplier))
	emit_signal("pointsHasBeenAdded")
	emit_signal("updatePointCount")

func updateHealth():
	emit_signal("updateHealthBar")

func newSpongeIsHere():
	var sponges = get_tree().get_nodes_in_group("sponge")
	if sponges.size() > 0:
		sponge = sponges.back()
		sponge.connect("spongeUpdate", Callable(self, "updateHealth"))

func _on_timer_timeout() -> void:
	health -= 5
	emit_signal("updateHealthBar")
