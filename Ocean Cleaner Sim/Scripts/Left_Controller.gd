extends XRController3D

@export var bagUI = "res://UIController.tscn"
@export var spawn_distance := 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_button_pressed("ax_button"):
		var spawn_pos = global_transform.origin + -global_transform.basis.z * spawn_distance
		bagUI.global_transform.origin = spawn_pos
