extends StaticBody3D

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Main/XROrigin3D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body is CharacterBody3D:
		print("Hello Player")
