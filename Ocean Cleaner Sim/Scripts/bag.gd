# Script for bag properties and functions.
extends RigidBody3D

# Signals to go out
signal bagSizeUpdate
signal bagUpdate

# Exporting variables to be used elsewhere
@export var bagSpace = 0
@export var bagLimit = 10

# Set the player variable to be global
var player

# Prepare the Audio
@onready var plop = $plop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Let the player node be the XROrigin in the Main scene
	player = get_node("/root/Main/XROrigin3D")
	# Connect a signal from the player script to this script and call this function when emitted.
	player.connect("pointsHasBeenAdded", Callable(self, "clearBagContents"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_enter_bag_detector_body_entered(body: Node3D) -> void:
	# print(body)
	# Ensure that the body is from the trash pile and the bags limit has not been reached
	if body.is_in_group("currentTrash") and bagSpace < bagLimit:
		# Play the plop sound effect
		plop.play()
		# Increment the bagSpace variable
		bagSpace += 1
		# Remove the trash from the scene.
		body.queue_free()
		# Emit this signal out to those who need it.
		emit_signal("bagUpdate")

# Called else where from another script.
func updateBag():
	# Will request to update the bag size
	print("Signal has been emitted from bag")
	emit_signal("bagSizeUpdate")

# Connected from the player to clear its contents once the points have been added
func clearBagContents():
	print("Bag is being emptied")
	bagSpace = 0
	emit_signal("bagUpdate")
