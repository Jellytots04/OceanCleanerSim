extends TabContainer

@onready var progressBar = $Bag/VBoxContainer/Scale/TextureProgressBar
@onready var pointsValue = $Bag/VBoxContainer/HBoxContainer/PointsCount
@onready var spongeBar = $Bag/VBoxContainer/Sponge/TextureProgressBar

var bag
var player
var shop
var sponge
var spongeSummoner
var spongeScript

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bag = get_node("/root/Main/BagStatic")
	bag.connect("bagUpdate", Callable(self, "updateBar"))
	bag.connect("bagSizeUpdate", Callable(self, "updateBagSize"))
	player = get_node("/root/Main/XROrigin3D")
	player.connect("updatePointCount", Callable(self, "updatePoints"))
	spongeSummoner = player.get_node("RightHand")
	spongeSummoner.connect("spongeSummoned", Callable(self, "newSpongeIsHere"))
	shop = get_node("/root/Main/Stage/UI Wall")
	shop.connect("updateBagSize", Callable(self, "updateBagSize"))
	shop.connect("updatePointCount", Callable(self, "updatePoints"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updatePoints():
	print("Updating points time")
	pointsValue.text = str(player.points)

func updateBar():
	progressBar.value = bag.bagSpace

func updateBagSize():
	progressBar.max_value = bag.bagLimit

func updateSpongeSize():
	spongeBar.max_value = spongeScript.spongeLimit
	
func updateSpongeBar():
	spongeBar.value = spongeScript.spongeSpace

func newSpongeIsHere():
	var sponges = get_tree().get_nodes_in_group("sponge")
	if sponges.size() > 0:
		print("Hello Sponge")
		sponge = sponges.back()
		sponge.connect("spongeUpdate", Callable(self, "updateSpongeBar"))
