extends RigidBody3D

signal bagSizeUpdate
signal bagUpdate

@export var bagSpace = 0
@export var bagLimit = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_enter_bag_detector_body_entered(body: Node3D) -> void:
	print(body)
	if body.is_in_group("currentTrash") and bagSpace < bagLimit:
		print("This is good trash")
		bagSpace += 1
		body.queue_free()
		emit_signal("bagUpdate")

func updateBag():
	print("Signal has been emitted from bag")
	emit_signal("bagSizeUpdate")
