extends Node2D

var shot = false
var collided = false
var returning = false
var hookSpeed = 12
var maxRange = 600
var minRange = 30
var direction
var hookPos := Vector2(0,0)

var loops = 4

const CHAINLINK = preload("res://PhysicsChainLink.tscn")
const CHAINLOOP = preload("res://PhysicsChainLoop.tscn")

# Called when the node enters the scene tree for the first time.
func shoot(dir):
	shot = true
	collided = false
	returning = false
	direction = dir.normalized()
	hookPos = self.global_position


func _ready():
	pass
	var parent = $HookBody
	for i in range(loops):
		var child = addLoop(parent)
		addLink(parent, child)
		parent = child


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if shot:
		self.visible = true
		var curr_length = $HookBody.position.distance_to(self.position)
		if curr_length > maxRange:
			returning = true
		elif returning:
			if curr_length < minRange:
				shot = false
		#$Chain.region_rect.size.y = curr_length*10
		#$Chain.rotation = self.position.angle_to_point($HookBody.position) - deg2rad(90)
		if not collided:
			$HookBody.rotation = self.position.angle_to_point($HookBody.position) - deg2rad(90)
		#$Chain.position = $HookBody.position/2
		
		
	else:
		collided = false
		self.visible = false

func _physics_process(delta):
	$HookBody.global_position = hookPos
	if shot and not collided:
		if returning:
			direction = (self.global_position - hookPos).normalized()
			#print(str(direction.x) + ", " + str(direction.y))
			if $HookBody.move_and_collide(direction * delta * 60 * hookSpeed):
				collided = true
		else:
			if $HookBody.move_and_collide(direction * delta * 60 * hookSpeed):
				collided = true
				returning =true
		hookPos = $HookBody.global_position
	
func addLoop(parent):
	var loop = CHAINLOOP.instance()
	loop.position = parent.position
	loop.position.y += 18
	add_child(loop)
	return loop
	
func addLink(parent, child):
	var pin = CHAINLINK.instance()
	pin.node_a = parent.get_path()
	pin.node_b = child.get_path()
	parent.add_child(pin)
