extends Node

class_name HookState


#vars exports to give some customizability to editor will add ranges
#vars for all children
export(float) var gravity = 10 #gravity influence on hook when extending out
export(float) var baseRange = 200
export(float) var maxRange = 1600
export(float) var baseSpeed = 500
export(float) var maxSpeed = 1000
export(float) var pullFactor = 3 #constant speed up when pulling player
export(float) var pullExpFactor = 1.3 #exponent on distance when pulling
export(float) var slowingFactor = 1 #slows x movement of extending hook approaching max range
export(float) var chargeRangeFactor = 3 #slows charge rate of launchrange 
export(float) var chargeSpeedFactor = 4 #slows charge rate of launchspeed

var hook : KinematicBody2D = null
var player : Object = null
var sharedVars : Object = null

func _ready():
	hook = owner
	player = owner.get_node("../Player")
	sharedVars = owner.get_node("HookStates")

#Functions Called From State Machine -> should be overwritten
func update_and_return(delta): 
	if sharedVars._charginHook: charge_hook(delta)
	_move_hook(delta)

func enter_state(host): return
func exit_state(host): return

#Functions Specific to states -> may be overwritten

func _move_hook(delta): return null
func jump_out(): return null

#Functions used by multiple children dont need to overwrite

func handle_input_poll(delta): 
	if Input.is_action_just_pressed('jump'):
		print("Polled Jump!")
	if Input.is_action_pressed('hook'):
		print("Polled Chargin'")
	if Input.is_action_just_released('hook'):
		print("Polled Hook!")
	return null

func handle_input_event(event):
	if event.is_action_pressed("jump") && !event.is_echo() && event.is_pressed():
		return jump_out()
	if event.is_action("hook") && !event.is_echo() && event.is_pressed():
		sharedVars.launchSpeed = baseSpeed
		sharedVars.launchRange = baseRange
		sharedVars._charginHook = true
	elif event.is_action_released("hook") && !event.is_echo():
		sharedVars._charginHook = false
		shoot_hook()
		return "airOut"
	return null

func shoot_hook():
	hook.position = player.position
	var direction = Vector2(Input.get_joy_axis(0, JOY_ANALOG_RX),
							 Input.get_joy_axis(0, JOY_ANALOG_RY)).angle()
	sharedVars.currentMovement = sharedVars.launchSpeed*Vector2(cos(direction),sin(direction))

func charge_hook(delta):
	if sharedVars.launchSpeed < maxSpeed:
		sharedVars.launchSpeed += (maxSpeed - baseSpeed) * delta/chargeSpeedFactor
	if sharedVars.launchRange < maxRange:
		sharedVars.launchRange += (maxRange - baseRange) * delta/chargeRangeFactor

func update_arm():
	return

func check_wrapping():
	return

func spawn_return():
	return

