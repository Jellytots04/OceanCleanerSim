# Script for holding the multipliers variable and timer functions.
extends RigidBody3D

# Export the Multiplier to be used elsewhere.
@export var currrentMultiplier: float = 1.0

# Load the timer on startup
@onready var timer = $Timer

# Global variables
var UI
var multiplierValue
var multiplierBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the variables to their respective nodes
	UI = $Viewport2Din3D/Viewport.get_child(0)
	multiplierValue = UI.get_node("Multiplier/VBoxContainer/Scale/Label")
	multiplierBar = UI.get_node("Multiplier/VBoxContainer/Scale/TextureProgressBar")
	multiplierBar.max_value = timer.wait_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Checks if the timer hasn't stopped if not then set the timers variable to the bars value
	if not timer.is_stopped():
		multiplierBar.value = timer.time_left
	# Else set it the 0
	else:
		multiplierBar.value = 0

# Function that updates the multiplier value on the UI to 2 decimal places.
func updateMultiplierValue():
	multiplierValue.text = "%0.2fx" % currrentMultiplier

# Reset the multiplier in when run out
func _on_timer_timeout() -> void:
	timer.wait_time = 15.0
	multiplierReset()

# Reset the multiplier back to 1 and update the value
func multiplierReset():
	currrentMultiplier = 1.0
	updateMultiplierValue()

# Starts the timer called from the bin script
func start_timer():
	timer.start()
	timer.wait_time /= 1.05
	multiplierBar.max_value = timer.wait_time
	print(timer.wait_time)
