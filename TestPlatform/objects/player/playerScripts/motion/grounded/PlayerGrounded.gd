extends PlayerGravity

class_name PlayerGrounded

func physics_process(delta):
	.physics_process(delta)
	if not shared.ray_bottom.is_colliding():
		change_state("Fall")

func input(event):
	.input(event)
	if Input.is_action_pressed("jump"):
		change_state("Jump")
	if Input.is_action_pressed("grip"):
		change_state("Crawl")
