extends "res://player/states/PlayerState.gd"

func enter():
	pass
	shared.ray_left.enabled = true
	shared.ray_right.enabled = true

func exit():
	pass
	#set raycasts disabled

func input(event):
	.input(event)
	
	if not Input.is_action_pressed("grip"):
		exit()
		change_state("Idle")
