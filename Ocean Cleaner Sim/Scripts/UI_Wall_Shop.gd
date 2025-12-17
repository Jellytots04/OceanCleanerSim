extends StaticBody3D

signal updateBagSize
signal updatePointCount
signal updateHealthMax

var viewport_scene
var player
var bag
var stage
var playerSpeed

@onready var playerUpgrades = $Shop/ShopViewPort/Viewport/MarginContainer/VBoxContainer/PlayerUpgrades
@onready var stageUpgrades = $Shop/ShopViewPort/Viewport/MarginContainer/VBoxContainer/StageUpgrades
@onready var bagSizeButton: Button = playerUpgrades.get_node("BagSize/bagSizeButton")
@onready var spongeSizeButton: Button = playerUpgrades.get_node("SpongeSize/spongeSizeButton")
@onready var speedButton: Button = playerUpgrades.get_node("PlayerSpeed/speedButton")
@onready var trashLimitButton: Button = stageUpgrades.get_node("trashLimit/trashLimitButton")
@onready var liquidLimitButton: Button = stageUpgrades.get_node("liquidLimit/liquidLimitButton")
@onready var moneyMakerButton: Button = stageUpgrades.get_node("moneyMakers/moneyMakersButton")

#signal increaseBagSize      # Signal to the bag
#signal increaseSpongeSize   # Signal to the sponge (yet to be added)
#signal increasePlayerSpeed  # Signal to the player script
#signal increaseTrashLimit   # Signal to stage
#signal increaseSpillLimit   # Signal to stage
#signal increasePriceOfTrash # Signal to stage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Main/XROrigin3D")
	bag = get_node("/root/Main/BagStatic")
	stage = get_node("/root/Main/Stage")
	playerSpeed = player.get_node("LeftHand/MovementDirect")
	viewport_scene = $Shop/ShopViewPort/Viewport.get_child(0) # Locate the margin container holding the items
	# print(viewport_scene)
	print(playerUpgrades)
	bagSizeButton.pressed.connect(increaseBagSize)
	spongeSizeButton.pressed.connect(increaseSpongeSize)
	speedButton.pressed.connect(increaseSpeed)
	trashLimitButton.pressed.connect(increaseTrashLimit)
	liquidLimitButton.pressed.connect(increaseLiquidLimit)
	moneyMakerButton.pressed.connect(winGameTime)
	print(playerSpeed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func increaseBagSize():
	var points = player.points
	var price = bagSizeButton.price
	if points >= price:
		removeFunds(price)
		bag.bagLimit += 1
		var new_price = ceil(price * 1.1)
		bagSizeButton.update_price(new_price)
		emit_signal("updateBagSize")

func increaseSpongeSize():
	var points = player.points
	var price = spongeSizeButton.price
	if points >= price:
		removeFunds(price)
		player.healthMax += 50
		var new_price = ceil(price * 1.5)
		bagSizeButton.update_price(new_price)
		emit_signal("updateHealthMax")
	
func increaseSpeed():
	var points = player.points
	var price = speedButton.price
	if points >= price:
		removeFunds(price)
		playerSpeed.max_speed += 0.2
		var new_price = ceil(price + 3)
		speedButton.update_price(new_price)

func increaseTrashLimit():
	var points = player.points
	var price = trashLimitButton.price
	if points >= price:
		removeFunds(price)
		stage.trashLimit += 5
		var new_price = ceil(price * 1.1)
		trashLimitButton.update_price(new_price)

func increaseLiquidLimit():
	var points = player.points
	var price = liquidLimitButton.price
	if points >= price:
		removeFunds(price)
		stage.liquidLimit += 1
		var new_price = ceil(price * 1.1)
		liquidLimitButton.update_price(new_price)
	
func winGameTime():
	# print("You have spent your money")
	var points = player.points
	var price = moneyMakerButton.price
	if points >= price:
		removeFunds(price)
		print("You have won logic")
		stage.win_animation()
		# Add logic for winning here
	# Make a money spent meter
	

func removeFunds(cost):
	player.points -= cost
	emit_signal("updatePointCount")
	# print("Removing the users funds")
