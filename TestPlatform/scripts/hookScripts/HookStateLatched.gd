extends HookState

class_name HookStateLatched


#Public Overrides
func update_and_return(delta):
	if get_parent()._charginHook: charge_hook(delta)
	var playerPos = player.position
	player.get_pulled(-delta*pow(hook.position.distance_to(playerPos), pullExpFactor)
					*pullFactor*hook.position.direction_to(playerPos))
	return null
	
func jump_out(): return "idle"

#func handle_input_event(event): return	

func enter_state(host): return

func exit_state(host): return

#Private Functions
