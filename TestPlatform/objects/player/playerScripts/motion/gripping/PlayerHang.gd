extends PlayerGripping

class_name PlayerHang

func physics_process(delta):
	shared.velocity.x = shared.direction.x * SPEED
	.physics_process(delta)


	if shared.ray_right.is_colliding() and (shared.direction.x == 1 or shared.direction.y == 1):
		change_state("Climb")
	elif shared.ray_left.is_colliding() and (shared.direction.x == -1 or shared.direction.y == 1):
		change_state("Climb")
		
	elif shared.direction.y == 1 or not shared.ray_top.is_colliding():
		change_state("Fall")
