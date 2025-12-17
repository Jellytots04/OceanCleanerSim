extends XROrigin3D

# Signals to go out
signal pointsHasBeenAdded
signal updatePointCount
signal updateHealthBar

# Exportable variables to be used in other scripts as well
@export var points = 5000
@export var healthMax = 250
@export var health = 250

# Load on start up the death message
@onready var deathMessage = $XRCamera3D/RestartUI

# Global Variables
var restartButton
var bin
var sponge
var bag
var shop
var multiplier

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the variables to nodes and set their signal listeners / connecters
	bag = get_node("/root/Main/BagStatic")
	bin = get_node("/root/Main/Stage/TrashBin")
	bin.connect("addPoints", Callable(self, "increasePointCount"))
	shop = get_node("/root/Main/Stage/UI Wall")
	shop.connect("requestPoints", Callable(self, "returnPointCount"))
	multiplier = get_node("/root/Main/Stage/UI Wall/Multiplier")
	# Get the viewports child.
	var messageViewport = $XRCamera3D/RestartUI/Viewport2Din3D/Viewport.get_child(0)
	# Find the restart button
	restartButton = messageViewport.get_child(1)
	# Set a pressed connect listener to call the function when the "restartButton" is clicked
	restartButton.pressed.connect(restartScene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function to increase the point count and have it return as a ceiling int then emit signals
func increasePointCount():
	# print("Receive points connect")
	points += int(ceil(bag.bagSpace * multiplier.currrentMultiplier))
	# Emits the points added to bag, and update point count to UI
	emit_signal("pointsHasBeenAdded")
	emit_signal("updatePointCount")

# Emits a signal to update health on UI
func updateHealth():
	emit_signal("updateHealthBar")

# Set connect for when user has summoned sponge into the scene.
func newSpongeIsHere():
	# Find the sponge nodes from the group sponge
	var sponges = get_tree().get_nodes_in_group("sponge")
	# Only check if the array has at least one.
	if sponges.size() > 0:
		# Get the latest instance of sponge.
		sponge = sponges.back()
		sponge.connect("spongeUpdate", Callable(self, "updateHealth"))

# Timer to damage the player.
func _on_timer_timeout() -> void:
	health -= 5
	# Check if the players health is 0 or less, then play the death time function
	if health <= 0:
		print("You may have collapsed")
		deathTime()
	emit_signal("updateHealthBar")

# Open up the deathTime message to the user.
func deathTime():
	deathMessage.visible = true

# Restarts the entier scene when the user presses restart game.
func restartScene():
	get_tree().reload_current_scene()
