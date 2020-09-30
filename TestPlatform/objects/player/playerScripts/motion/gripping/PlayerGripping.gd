extends PlayerState

class_name PlayerGripping

var SPEED = 250

func enter():
	pass


func exit():
	pass
	#set raycasts disabled

func input(event):
	.input(event)
	
	if not Input.is_action_pressed("grip"):
		exit()
		change_state("Fall")
