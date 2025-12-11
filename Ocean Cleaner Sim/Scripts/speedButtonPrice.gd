extends Button

@export var price: int = 25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_price(newPrice:int):
	price = newPrice
	self.text = "$ %d " % newPrice
