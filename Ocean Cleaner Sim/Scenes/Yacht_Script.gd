extends Node3D

var spawn_pos
@onready var yachtMesh = $Yacht
@onready var animation = $AnimationPlayer

func _ready() -> void:
	spawn_yacht()

# Spawn it at -50 and tween it to 0 z
func spawn_yacht():
	spawn_pos = yachtMesh.global_position.z - 50

func move_animation():
	animation.play("YachtBob")

func stationed():
	animation.play("bobstationed")
	
