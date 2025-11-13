extends Node3D

@export var trash_pile: PackedScene
@onready var spawn_floor: MeshInstance3D = $SpawnFloor

# Will be used to hold the values
var currentTrash = []

# Limit to how much trash can be in the water
var trashLimit = 5
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_pickable():
	var aabb = spawn_floor.mesh.get_aabb()
	var global_origin = spawn_floor.global_transform.origin
	var x = randf_range(global_origin.x + aabb.position.x, global_origin.x + aabb.position.x + aabb.size.x)
	var z = randf_range(global_origin.z + aabb.position.z, global_origin.z + aabb.position.z + aabb.size.z)
	var y = 0.1
	var instance = trash_pile.instantiate()
	instance.global_position = Vector3(x, y, z)
	currentTrash.append(instance)
	add_child(instance)


func _on_spawn_timer_timeout() -> void:
	if trashLimit > currentTrash.size():
		spawn_pickable()
	else: 
		print("Limit has been reached")
