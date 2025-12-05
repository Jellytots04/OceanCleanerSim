extends RigidBody3D

@export var trash: PackedScene = load("res://Trash/trash.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#
#func _on_body_entered(body: Node) -> void:
	#print(body)
	#if body == trash:
		#print("This is good trash")

func _on_enter_bag_detector_body_entered(body: Node3D) -> void:
	print(body)
	if body == trash:
		print("This is good trash")
