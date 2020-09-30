extends "res://player/states/motion/grounded/Grounded.gd"

func physics_process(delta):
	.physics_process(delta)
	
	if shared.direction != 0:
		change_state("Walk")

