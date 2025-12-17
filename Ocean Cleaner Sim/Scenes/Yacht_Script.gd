# Script for the yacht functions
extends Node3D

# Global variable
var spawn_pos

# Load variables on start up
@onready var yachtMesh = $Yacht
@onready var animation = $AnimationPlayer
@onready var horn = $FogHorn

# Set the yachts new spawn
func _ready() -> void:
	spawn_yacht()

# Spawn it at -50 and tween it to 0 z
func spawn_yacht():
	spawn_pos = yachtMesh.global_position.z - 50

# Play the animation for bobbing
func move_animation():
	animation.play("YachtBob")

# Play the animation for stationary
func stationed():
	animation.play("bobstationed")
	
