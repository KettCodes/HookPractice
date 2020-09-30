extends "res://player/states/motion/gripping/Gripping.gd"

var SPEED = 200

func physics_process(delta):
	shared.velocity.x = shared.direction * SPEED
	.physics_process(delta)

	if shared.ray_right.is_colliding() && shared.direction == 1:
		change_state("Climb")
	if shared.ray_left.is_colliding() && shared.direction == -1:
		change_state("Climb")
