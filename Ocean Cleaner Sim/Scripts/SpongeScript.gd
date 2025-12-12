extends Node

signal spongeUpdate

var player
var rightController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Main/XROrigin3D")
	player.connect("spongeHasBeenCleaned", Callable(self, "clearSponge"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	print("Sponge Sees", body)
	if body.is_in_group("currentLiquids"):
		
		if player.health < player.healthMax-5:
			player.health += 5
		body.queue_free()
		emit_signal("spongeUpdate")
