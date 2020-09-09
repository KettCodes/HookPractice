extends HookState

class_name HookStateAirOut


#Public Overrides
func update_and_return(delta):
	if get_parent()._charginHook: charge_hook(delta)
	_move_hook(delta)
	if get_parent().hit:
		return "latched"
	if hook.position.distance_to(player.position) > get_parent().launchRange:
		get_parent().currentMovement = Vector2(0.0,0.0)
		return "airIn"
	return null
	
#func handle_input_event(event): pass
	
func enter_state(host): return

func exit_state(host): return

#Private Functions
func _move_hook(delta):
	hook.rotation = hook.position.angle_to_point(player.position) + deg2rad(90)
	var extension = (get_parent().launchRange-hook.position.distance_to(player.position))/get_parent().launchRange
	get_parent().currentMovement.x -= slowingFactor * (1-extension) * delta
	get_parent().currentMovement.y += delta * gravity
	get_parent().hit = hook.move_and_collide(get_parent().currentMovement*delta)
