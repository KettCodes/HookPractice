extends HookState

class_name HookStateAirIn


#Public Overrides
func update_and_return(delta):
	if get_parent()._charginHook: charge_hook(delta)
	_move_hook(delta)
	if get_parent().hit:
		return "latched"
	if hook.position.distance_to(player.position) < 40:
		get_parent().currentMovement = Vector2.ZERO
		return "idle"
	return null
	
#func handle_input_event(event): pass
	
func enter_state(host): return

func exit_state(host): return

#Private Functions
func _move_hook(delta):
	var playerPos = player.position
	hook.rotation = hook.position.angle_to_point(playerPos) + deg2rad(90)
	var speed = get_parent().currentMovement.length()
	get_parent().currentMovement *= 0.95
	get_parent().currentMovement += (hook.position.distance_to(playerPos)) \
						* hook.position.direction_to(playerPos) * delta * max(min(1,(speed+1)/200), 10)
	get_parent().hit = hook.move_and_collide(get_parent().currentMovement*delta)

