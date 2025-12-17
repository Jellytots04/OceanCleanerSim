# Script for holding the price of the liquid button upgrade in the shop
extends Button

# Set the price and have it be exported to be used by other scripts
@export var price: int = 75

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Update the price.
func update_price(newPrice:int):
	price = newPrice
	self.text = "$ %d " % newPrice
	
