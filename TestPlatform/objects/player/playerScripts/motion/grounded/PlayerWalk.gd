extends PlayerGrounded

class_name PlayerWalk

var SPEED = 400

func physics_process(delta):
	shared.velocity.x = shared.direction.x * SPEED
	.physics_process(delta)
	
	if shared.velocity.x == 0:
		change_state("Idle")
