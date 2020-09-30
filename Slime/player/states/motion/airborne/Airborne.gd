extends "res://player/states/motion/Gravity.gd"

var SPEED = 400

func physics_process(delta):
	shared.velocity.x = shared.direction * SPEED
	.physics_process(delta)
