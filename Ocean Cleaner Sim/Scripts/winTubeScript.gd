# Script for the win tubes functions
extends StaticBody3D

# Global variables
var player
var tym

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the variables to their nodes
	player = get_node("/root/Main/XROrigin3D")
	tym = get_node("/root/Main/Stage/ThankYouMessage")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Body entered from Area3D
func _on_area_3d_body_entered(body: Node3D) -> void:
	#print(body)
	# Only trigger the event when the player enters the area
	if body is CharacterBody3D:
		# Set the thank you message to be visible
		tym.visible = true
		# Make self invisible
		self.visible = false
		#print("Hello Player")
