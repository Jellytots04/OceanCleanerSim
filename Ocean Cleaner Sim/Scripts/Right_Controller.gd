extends XRController3D

signal spongeSummoned

@onready var sponge = load("res://Scenes/sponge.tscn")

var is_active := false
var spawn_distance := 1.0
var spongeSummon: Node3D = null
var was_pressed := false

func _process(delta: float) -> void:
	var pressed := is_button_pressed("ax_button")

	# 1. Just pressed -> spawn once
	if pressed and not was_pressed and not is_active:
		spongeSummon = sponge.instantiate()
		get_tree().current_scene.add_child(spongeSummon)
		spongeSummon.add_to_group("sponge")
		emit_signal("spongeSummoned")
		is_active = true

	# 2. While held -> keep sponge in front of hand
	if pressed and is_active and spongeSummon:
		var spawn_pos := global_position + -global_transform.basis.z * spawn_distance
		spongeSummon.global_transform.origin = spawn_pos

	# 3. Just released -> remove sponge
	if not pressed and was_pressed and is_active and spongeSummon:
		spongeSummon.queue_free()
		spongeSummon = null
		is_active = false

	was_pressed = pressed
