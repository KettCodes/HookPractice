extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var playerScene = load("res://Player.tscn")
	var player = playerScene.instance()
	add_child(player)
	
	player.position = Vector2(290,315)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
