extends "res://player/states/motion/gripping/Gripping.gd"

var wall = 0

func enter():
	.enter()
	wall = int(shared.ray_right.is_colliding()) - int(shared.ray_left.is_colliding())

func physics_process(delta):
	shared.velocity.y = shared.direction.y * SPEED
	.physics_process(delta)
	
	if shared.ray_top.is_colliding() and (shared.direction.y == 1 or shared.direction.x == wall * -1):
		change_state("Hang")
	
	elif shared.player.is_on_floor() and not (shared.ray_left.is_colliding() or shared.ray_right.is_colliding()):
		change_state("Crawl")
		
	elif shared.direction.x == wall * -1 or not (shared.ray_left.is_colliding() or shared.ray_right.is_colliding()):
		change_state("Fall")
