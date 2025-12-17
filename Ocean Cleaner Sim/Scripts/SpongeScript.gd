# Script for the sponge functions
extends Node

# Signal to go out
signal spongeUpdate

# Gloabl variables
var player
var rightController

# Load variables on start up, Particle effect and sound effects.
@onready var plop = $Plop
@onready var particles = $GPUParticles3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the variables to respective nodes
	player = get_node("/root/Main/XROrigin3D")
	player.connect("spongeHasBeenCleaned", Callable(self, "clearSponge"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# When body entered function from Area 3D
func _on_area_3d_body_entered(body: Node3D) -> void:
	# print("Sponge Sees", body)
	# Check if the body colliding is in the liquids group
	if body.is_in_group("currentLiquids"):
		# play sound.
		plop.play()
		# Start the particles
		particles.emitting = true
		# Check if the players health is not maxed out already
		if player.health < player.healthMax-5:
			player.health += 5
		# Remove liquid from scene
		body.queue_free()
		# Update "health" bar
		emit_signal("spongeUpdate")
