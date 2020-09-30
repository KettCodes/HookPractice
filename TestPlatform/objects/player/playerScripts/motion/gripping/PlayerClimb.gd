extends PlayerGripping

class_name PlayerClimb

var SPEED = 100
var wall = 0

func enter():
	.enter()
	wall = shared.direction

func physics_process(delta):
	shared.velocity.y = -SPEED
	.physics_process(delta)
	
	if shared.player.is_on_floor() and not shared.player.is_on_wall():
		change_state("Crawl")
