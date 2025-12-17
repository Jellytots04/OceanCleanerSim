# Script for the bin / furnace for holding its variables, functions and signals
extends StaticBody3D

# Signals to go out
signal addPoints
signal emptyBag

# Global variables
var bag
var multiplierScript
var multiplierV
var multiplierContent

# Variables to be loaded on start up
@onready var particles = $GPUParticles3D
@onready var fire = $Fire

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the variables to their respective nodes
	bag = get_node("/root/Main/BagStatic")
	multiplierScript = get_node("/root/Main/Stage/UI Wall/Multiplier")
	multiplierV = get_node("/root/Main/Stage/UI Wall/Multiplier/Viewport2Din3D/Viewport")
	# Get the viewports child being the contents
	multiplierContent = multiplierV.get_child(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	# print(body)
	# Ensure that the body is the bag and has contents inside
	if body == bag and bag.bagSpace > 0:
		# print("This is the bag yippee")
		# Play the fire sound effect.
		fire.play()
		# Add points function
		pointAdd()
		# Particles will start emitting (one play)
		particles.emitting = true
		# Increase the multiplier, update its value on the UI and start the timer
		multiplierScript.currrentMultiplier += 0.3
		multiplierScript.updateMultiplierValue()
		multiplierScript.start_timer()

# Emits the addPoints signal
func pointAdd():
	emit_signal("addPoints")

# Emits the clear bag items signal
func clearBagItems():
	emit_signal("emptyBag")
