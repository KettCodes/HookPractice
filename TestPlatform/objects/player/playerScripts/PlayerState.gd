extends Node

class_name PlayerState

var fsm : PlayerStateMachine

onready var shared = owner.get_node("SharedVariables")

func change_state(new_state):
	shared.current_state.text = String(new_state)
	fsm.change_to(new_state)

func physics_process(delta):
	shared.velocity = shared.player.move_and_slide(shared.velocity, Vector2.UP)

func input(event):
	shared.direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	shared.current_direction.text = String(shared.direction)

func enter():
	pass

func exit():
	pass

####################################################
### Optional handler functions for game loop events.
### Delete the ones that you don't need.
####################################################
func process(_delta):
	pass

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
