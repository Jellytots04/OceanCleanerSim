extends Node

var spongeSpace = 0
var spongeLimit = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body.is_in_group("") and spongeSpace < spongeLimit:
		pass # Replace with function body.

	#print(body)
	#if body.is_in_group("currentTrash") and bagSpace < bagLimit:
		#print("This is good trash")
		#bagSpace += 1
		#body.queue_free()
		#emit_signal("bagUpdate")
