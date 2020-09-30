extends PlayerGrounded

class_name PlayerIdle

func physics_process(delta):
	.physics_process(delta)
	
	if shared.direction.x != 0:
		change_state("Walk")
