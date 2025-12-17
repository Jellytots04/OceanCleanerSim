extends XROrigin3D

signal pointsHasBeenAdded
signal updatePointCount
signal updateHealthBar

@export var points = 0
@export var healthMax = 250
@export var health = 250

@onready var deathMessage = $XRCamera3D/RestartUI

var restartButton
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
	var messageViewport = $XRCamera3D/RestartUI/Viewport2Din3D/Viewport.get_child(0)
	restartButton = messageViewport.get_child(1)
	restartButton.pressed.connect(restartScene)
	#print("my last message to you caeser is ", deathMessage)
	#print("To restart press !!! ", restartButton)

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
	if health <= 0:
		print("You may have collapsed")
		deathTime()
	emit_signal("updateHealthBar")


func deathTime():
	deathMessage.visible = true

func restartScene():
	get_tree().reload_current_scene()
