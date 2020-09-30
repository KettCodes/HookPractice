extends Node

onready var player : KinematicBody2D = owner
onready var current_state : Label = player.get_node('CurrentState')
onready var current_direction : Label = player.get_node('CurrentDirection')
onready var ray_left : RayCast2D = player.get_node("RayLeft")
onready var ray_right : RayCast2D = player.get_node("RayRight")
onready var ray_top : RayCast2D = player.get_node("RayTop")
onready var ray_bottom : RayCast2D = player.get_node("RayBottom")

func _ready():
	ray_left.enabled = true
	ray_right.enabled = true
	ray_top.enabled = true
	ray_bottom.enabled = true

var velocity := Vector2.ZERO
var direction = Vector2.ZERO
