extends RigidBody3D

@export var currrentMultiplier: float = 1.0

var UI
var multiplierValue
var multiplierBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UI = $Viewport2Din3D/Viewport.get_child(0)
	multiplierValue = UI.get_node("Multiplier/VBoxContainer/Scale/Label")
	multiplierBar = UI.get_node("Multiplier/VBoxContainer/Scale/TextureProgressBar")
	print("Lets see the two of these together ", multiplierValue, "AND NOW! ", multiplierBar)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updateMultiplier():
	pass

# Reset the multiplier in when run out
func _on_timer_timeout() -> void:
	multiplierReset()

func multiplierReset():
	currrentMultiplier = 1.0
