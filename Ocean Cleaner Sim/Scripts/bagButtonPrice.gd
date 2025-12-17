# Script for holding the price of bag button upgrade in the shop
extends Button

# Set the price
@export var price: int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function called in another script to set the new price.
func update_price(newPrice:int):
	price = newPrice
	self.text = "$ %d " % newPrice
