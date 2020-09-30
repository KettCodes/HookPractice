extends PlayerAirborne

class_name PlayerFall

func physics_process(delta):
	.physics_process(delta)
	
	if shared.player.is_on_floor():
		change_state("Idle")
