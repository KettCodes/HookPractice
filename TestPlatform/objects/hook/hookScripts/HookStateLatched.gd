extends HookState

class_name HookStateLatched


#Public Overrides
func update_and_return(delta):
	.update_and_return(delta)
	_pull_player(delta)
	return null
	
func jump_out(): return "idle"

#func handle_input_event(event): return	

func enter_state(host): return

func exit_state(host): return

#Private Functions

func _pull_player(delta):
	var playerPos = player.position
	var hookPos = hook.position
	#player.get_yanked(-delta*pow(hookPos.distance_to(playerPos), pullExpFactor)
	#				*pullFactor*hookPos.direction_to(playerPos))
