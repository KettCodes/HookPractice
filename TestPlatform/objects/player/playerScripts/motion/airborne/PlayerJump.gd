extends PlayerAirborne

class_name PlayerJump

func enter():	
	shared.velocity.y = -400

func physics_process(delta):
	.physics_process(delta)
	
	if shared.velocity.y >= 0:
		change_state("Fall")
