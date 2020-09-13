# https://gdscript.com/godot-state-machine
extends Node

var fsm : StateMachine

func enter():
	pass

func exit():
	pass

func change_state(new_state):
	fsm.change_to(new_state)

####################################################
### Optional handler functions for game loop events.
### Delete the ones that you don't need.
####################################################
func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
