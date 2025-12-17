# Script for the stage holding all of its variables and functions.
extends Node3D

# Export variabeles 
@export var trash_pile: PackedScene
@export var liquid_spill: PackedScene

# Load varibales on start up
@onready var spawn_floor: MeshInstance3D = $SpawnFloor
@onready var yacht = $YachtAnimation
@onready var winTube = $winWalker
@onready var particles = $GPUParticles3D

# Will be used to hold the values
var currentTrash = []
var currentLiquids = []

# Limit to how much trash can be in the water
@export var trashLimit = 5
@export var liquidLimit = 3
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function that spawns in trash
func spawn_pickable():
	# Gets the floors mesh locations
	var aabb = spawn_floor.mesh.get_aabb()
	var global_origin = spawn_floor.global_transform.origin
	# Set the XZ to random coordinates within the range
	var x = randf_range(global_origin.x + aabb.position.x, global_origin.x + aabb.position.x + aabb.size.x)
	var z = randf_range(global_origin.z + aabb.position.z, global_origin.z + aabb.position.z + aabb.size.z)
	var y = 0.1
	# Instantiate the trash pile
	var instance = trash_pile.instantiate()
	instance.global_position = Vector3(x, y, z)
	# Add the trash to the current Trash group
	instance.add_to_group("currentTrash")
	add_child(instance)
	# Start the partile at the location of the spawned trash
	particles.global_position = Vector3(x, y, z)
	particles.emitting = true

# Function that spawns in liquids
func spawn_liquid():
	# Same as trash but for liquids
	var aabb = spawn_floor.mesh.get_aabb()
	var global_origin = spawn_floor.global_transform.origin
	var x = randf_range(global_origin.x + aabb.position.x, global_origin.x + aabb.position.x + aabb.size.x)
	var z = randf_range(global_origin.z + aabb.position.z, global_origin.z + aabb.position.z + aabb.size.z)
	var y = 0.1
	var instance = liquid_spill.instantiate()
	instance.global_position = Vector3(x, y, z)
	instance.add_to_group("currentLiquids")
	add_child(instance)

# Timeout to spawn in the liquids and the trash
func _on_spawn_timer_timeout() -> void:
	currentTrash = get_tree().get_nodes_in_group("currentTrash")
	currentLiquids = get_tree().get_nodes_in_group("currentLiquids")
	if trashLimit > currentTrash.size(): # Checks if they're full
		spawn_pickable()
		#print("New trash has been added")
	else: 
		#print("Limit has been reached")
		pass
	if liquidLimit > currentLiquids.size(): # Checks if they're full
		spawn_liquid()
		#print("New liquid has been added")
	else:
		#print("Liquid limit reached")
		pass

# Function for the win animation to start called from another function
func win_animation():
	# Play the horn sound effect.
	yacht.horn.play()
	# Make the yacht visible.
	yacht.visible = true
	# Start the move animation.
	yacht.move_animation()
	# Get the origin spot
	var origin: Vector3 = yacht.global_position
	#print(origin)
	# Get a new spawn position of the yacht.
	var spawn_pos = origin
	spawn_pos.z = -50.0
	#print(spawn_pos)
	# Move it to the new spawn Z
	yacht.global_position.z = spawn_pos.z
	#print(yacht.global_position.z)
	# Tween it back to its origin
	var tween = yacht.create_tween()
	tween.tween_property(yacht, "global_position", origin, 12).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.finished.connect(func():stationed())

# Function to play the stationed animation while stationary.
func stationed():
	yacht.stationed()
	winTube.visible = true
