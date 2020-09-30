extends PlayerGravity

class_name PlayerGrounded

func physics_process(delta):
	.physics_process(delta)
	
	if not shared.player.is_on_floor():
#		change_state("Fall")
		print_debug("Falling")

func input(event):
	.input(event)
	if Input.is_action_pressed("jump"):
		change_state("Jump")
	if Input.is_action_pressed("grip"):
		change_state("Crawl")
