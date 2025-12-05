extends RigidBody3D

var bagSpace = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_enter_bag_detector_body_entered(body: Node3D) -> void:
	print(body)
	if body.is_in_group("currentTrash"):
		print("This is good trash")
		bagSpace += 1
		body.queue_free()
