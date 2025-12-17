# Script for the right controller
extends XRController3D

# Signal to go out
signal spongeSummoned

# Load variable from the files on start up.
@onready var sponge = load("res://Scenes/sponge.tscn")

# Set global variables
var is_active := false
var spawn_distance := 1.0
var spongeSummon: Node3D = null
var was_pressed := false
var tween_done := false

func _process(delta: float) -> void:
	# Set this variable to the true or false bool of the button pressed openXR variable
	var pressed := is_button_pressed("ax_button")

	# 1. Just pressed -> spawn once and tween from hand
	if pressed and not was_pressed and not is_active:
		# Instantiate the sponge to the scene
		spongeSummon = sponge.instantiate()
		# Add it to the scene
		get_tree().current_scene.add_child(spongeSummon)
		# Add it to the group
		spongeSummon.add_to_group("sponge")
		emit_signal("spongeSummoned")
		is_active = true
		tween_done = false

		# start at controller
		spongeSummon.global_position = global_position

		# target in front of controller
		var target_pos := global_position + -global_transform.basis.z * spawn_distance

		# tween from hand -> target
		var tween := create_tween()
		tween.tween_property(spongeSummon, "global_position", target_pos, 0.25)
		tween.finished.connect(func():tween_done = true)

	# 2. After tween finished, keep it fixed in front of controller
	if pressed and is_active and tween_done and spongeSummon:
		var follow_pos := global_position + -global_transform.basis.z * spawn_distance
		spongeSummon.global_position = follow_pos

	# 3. Just released -> remove sponge
	if not pressed and was_pressed and is_active and spongeSummon:
		spongeSummon.queue_free()
		spongeSummon = null
		is_active = false
		tween_done = false

	was_pressed = pressed
