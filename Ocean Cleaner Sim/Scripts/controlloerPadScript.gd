extends TabContainer

@onready var progressBar = $Bag/VBoxContainer/Scale/TextureProgressBar
var bag

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bag = get_node("/root/Main/BagStatic")
	bag.connect("bagUpdate", Callable(self, "updateBar"))
	bag.connect("bagSizeUpdate", Callable(self, "updateBagSize"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updateBar():
	print("Bag has been emitted")
	progressBar.value = bag.bagSpace

# Place holder for updating bag size script
func updateBagSize():
	progressBar.max_value = bag.bagLimit
