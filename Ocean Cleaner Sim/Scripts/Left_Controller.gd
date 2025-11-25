extends XRController3D

@onready var bagUI = $"../../StaticBody3D"
@onready var bag = $"../../BagStatic"
@export var spawn_distance := 5.0

var bagUI_base_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(bag)
	print(bagUI)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_button_pressed("ax_button"):
		pass

	if is_button_pressed("grip_click"):
		var bag_offset = Vector3(0, -0.2, 0.2)
		var offset_position = global_transform.origin + global_transform.basis * bag_offset
		var tween = bag.create_tween()
		tween.set_parallel(true)
		tween.tween_property(bag, "global_position", offset_position, 1.0).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		tween.tween_property(bag, "rotation", -self.rotation, 0.1)
		
#
#tween.tween_property($Sprite, "position:y", 400, 1.0)\
		#.set_trans(Tween.TRANS_BOUNCE)\
		#.set_ease(Tween.EASE_OUT)
