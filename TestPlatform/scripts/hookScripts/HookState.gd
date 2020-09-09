extends Node

class_name HookState


#vars exports to give some customizability to editor will add ranges
#vars for all children
export(float) var gravity = 10 #gravity influence on hook when extending out
export(float) var baseRange = 200
export(float) var maxRange = 1600
export(float) var baseSpeed = 500
export(float) var maxSpeed = 1000
export(float) var pullFactor = 5 #constant speed up when pulling player
export(float) var pullExpFactor = 1.25 #exponent on distance when pulling
export(float) var slowingFactor = 1 #slows x movement of extending hook approaching max range

var hook : KinematicBody2D = null
var player : Object = null

#vars accessed through parent
var _charginHook : bool = false
var launchRange : float = baseRange
var launchSpeed : float = baseSpeed
var currentMovement : Vector2 = Vector2(0.0, 0.0)
var hit : Object = null

func _ready():
	hook = owner
	player = owner.get_node("../Player")

#Functions Called From State Machine -> should be overwritten
func update_and_return(delta): return
func enter_state(host): return
func exit_state(host): return

#Functions Specific to states -> may be overwritten

func jump_out(): return null

#Functions used by multiple children dont need to overwrite

func handle_input_poll(delta): 
	if Input.is_action_just_pressed('ui_jump'):
		print("Polled Jump!")
	if Input.is_action_pressed('ui_hook'):
		print("Polled Chargin'")
	if Input.is_action_just_released('ui_hook'):
		print("Polled Hook!")
	return null

func handle_input_event(event):
	if event.is_action_pressed("ui_jump") && !event.is_echo() && event.is_pressed():
		return jump_out()
	if event.is_action("ui_hook") && !event.is_echo() && event.is_pressed():
		get_parent().launchSpeed = baseSpeed
		get_parent().launchRange = baseRange
		get_parent()._charginHook = true
	elif event.is_action_released("ui_hook") && !event.is_echo():
		get_parent()._charginHook = false
		shoot_hook()
		return "airOut"
	return null

func shoot_hook():
	hook.position = player.position
	var direction = Vector2(Input.get_joy_axis(0, JOY_ANALOG_RX),
							 Input.get_joy_axis(0, JOY_ANALOG_RY)).angle()
	get_parent().currentMovement = get_parent().launchSpeed*Vector2(cos(direction),sin(direction))
	#print("launchSpeed: " + String(get_parent().launchSpeed))
	#print("launchAngle: " + String(get_parent().launchRange) + ", " + String(sin(direction)))

func charge_hook(delta):
	if launchSpeed < maxSpeed:
		get_parent().launchSpeed += (maxSpeed - baseSpeed) * delta/2
	if launchRange < maxRange:
		get_parent().launchRange += (maxRange - baseRange) * delta/2

func update_rope():
	return

func check_wrapping():
	return

func spawn_return():
	return

