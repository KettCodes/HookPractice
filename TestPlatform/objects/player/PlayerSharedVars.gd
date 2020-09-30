extends Node

onready var player : KinematicBody2D = owner
onready var current_state : Label = player.get_node('CurrentState')
onready var current_direction : Label = player.get_node('CurrentDirection')
onready var ray_left : RayCast2D = player.get_node("RayLeft")
onready var ray_right : RayCast2D = player.get_node("RayRight")

var velocity := Vector2.ZERO
var direction = 0
