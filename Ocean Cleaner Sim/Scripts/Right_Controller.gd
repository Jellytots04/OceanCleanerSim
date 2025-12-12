extends XRController3D

@onready var sponge = "res://Scenes/sponge.tscn"
var is_active
var spawn_distance := 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_button_pressed("ax_button") and !is_active:
		is_active = true
		var spawn_pos = global_transform.origin + -global_transform.basis.z * spawn_distance
		var new_obj = sponge.instantiate()
		new_obj.global_transform.origin = spawn_pos
		get_tree().current_scene.add_child(new_obj)
