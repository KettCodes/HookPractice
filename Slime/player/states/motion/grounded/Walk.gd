extends "res://player/states/motion/grounded/Grounded.gd"

var SPEED = 400

func physics_process(delta):
	shared.velocity.x = shared.direction * SPEED
	.physics_process(delta)
	
	if shared.velocity.x == 0:
		change_state("Idle")
