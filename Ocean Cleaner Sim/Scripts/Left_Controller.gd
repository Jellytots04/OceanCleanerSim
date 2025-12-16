extends XRController3D

@onready var bagUI = $"../../Stage/UI Wall/UI"
@onready var bag = $"../../BagStatic"
@export var spawn_distance := 5.0

var bagUI_base_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bagUI_base_pos = bagUI.global_position
	print(bag)
	print(bagUI)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_button_pressed("ax_button"):
		var bagUI_offset = Vector3(0, 0.2, 0.2)
		var offset_position = global_transform.origin + global_transform.basis * bagUI_offset
		var tween = bagUI.create_tween()
		tween.set_parallel(true)
		tween.tween_property(bagUI, "global_position", offset_position, 1.0).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		tween.tween_property(bagUI, "scale", Vector3(0.2,0.2,0.2), .1)
	else:
		var tween = bagUI.create_tween()
		tween.set_parallel(true)
		tween.tween_property(bagUI, "global_position", bagUI_base_pos, 1.0)
		tween.tween_property(bagUI, "scale", Vector3(1,1,1), .3)
		

	if is_button_pressed("grip_click"):
		var bag_offset = Vector3(0, -0.2, -0.1) # Offset for the bag to the controller
		var offset_position = global_transform.origin + global_transform.basis * bag_offset
		var tween = bag.create_tween()
		tween.tween_property(bag, "global_position", offset_position, 1.0).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN)
		bag.global_basis = self.global_basis

# tween.tween_property(self, "scale", Vector2.ONE, 0.3)
