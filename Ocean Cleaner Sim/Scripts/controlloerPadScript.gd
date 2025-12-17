# Script for the player bag UI
extends TabContainer

# Load variables on start up
@onready var progressBar = $Bag/VBoxContainer/Scale/TextureProgressBar
@onready var pointsValue = $Bag/VBoxContainer/HBoxContainer/PointsCount
@onready var spongeBar = $Bag/VBoxContainer/Sponge/TextureProgressBar

# Set global variables
var bag
var player
var shop
var sponge
var spongeSummoner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the global variables to nodes in the main scene and connect their signals
	bag = get_node("/root/Main/BagStatic")
	bag.connect("bagUpdate", Callable(self, "updateBar"))
	bag.connect("bagSizeUpdate", Callable(self, "updateBagSize"))
	player = get_node("/root/Main/XROrigin3D")
	player.connect("updatePointCount", Callable(self, "updatePoints"))
	player.connect("updateHealthBar", Callable(self, "updateSpongeBar"))
	spongeSummoner = player.get_node("RightHand")
	spongeSummoner.connect("spongeSummoned", Callable(self, "newSpongeIsHere"))
	shop = get_node("/root/Main/Stage/UI Wall")
	shop.connect("updateBagSize", Callable(self, "updateBagSize"))
	shop.connect("updatePointCount", Callable(self, "updatePoints"))
	shop.connect("updateHealthMax", Callable(self, "updateSpongeSize"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function to update the points on the board.
func updatePoints():
	print("Updating points time")
	pointsValue.text = str(player.points)

# Function to update the bag space bar.
func updateBar():
	progressBar.value = bag.bagSpace

# Function to update the overall size of the bag bar.
func updateBagSize():
	progressBar.max_value = bag.bagLimit

# Function to update the health bars max value.
func updateSpongeSize():
	spongeBar.max_value = player.healthMax

# Function to update the health bar
func updateSpongeBar():
	spongeBar.value = player.health
