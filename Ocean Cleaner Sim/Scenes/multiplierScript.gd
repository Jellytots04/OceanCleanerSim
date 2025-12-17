extends RigidBody3D

@export var currrentMultiplier: float = 1.0

@onready var timer = $Timer

var UI
var multiplierValue
var multiplierBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UI = $Viewport2Din3D/Viewport.get_child(0)
	multiplierValue = UI.get_node("Multiplier/VBoxContainer/Scale/Label")
	multiplierBar = UI.get_node("Multiplier/VBoxContainer/Scale/TextureProgressBar")
	multiplierBar.max_value = timer.wait_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not timer.is_stopped():
		multiplierBar.value = timer.time_left
	else:
		multiplierBar.value = 0

func updateMultiplierValue():
	multiplierValue.text = "%0.2fx" % currrentMultiplier

# Reset the multiplier in when run out
func _on_timer_timeout() -> void:
	multiplierReset()

func multiplierReset():
	currrentMultiplier = 1.0
	updateMultiplierValue()

func start_timer():
	timer.start()
