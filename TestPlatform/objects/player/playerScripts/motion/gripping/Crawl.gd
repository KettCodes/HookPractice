extends "res://player/states/motion/gripping/Gripping.gd"

export var GRAVITY = 400

func physics_process(delta):
	shared.velocity.x = shared.direction.x * SPEED
	shared.velocity.y += GRAVITY * delta
	.physics_process(delta)

	if shared.ray_right.is_colliding() and (shared.direction.x == 1 or shared.direction.y == -1):
		change_state("Climb")
	elif shared.ray_left.is_colliding() and (shared.direction.x == -1 or shared.direction.y == -1):
		change_state("Climb")

	elif not shared.player.is_on_floor():
		change_state("Fall")
