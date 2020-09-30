extends PlayerGravity

class_name PlayerAirborne

var SPEED = 400

func physics_process(delta):
	shared.velocity.x = shared.direction.x * SPEED
	.physics_process(delta)
	if Input.is_action_pressed("grip") and shared.ray_right.is_colliding() and shared.direction.x == 1:
		change_state("Climb")
	if Input.is_action_pressed("grip") and shared.ray_left.is_colliding() and shared.direction.x == -1:
		change_state("Climb")
