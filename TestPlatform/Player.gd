extends KinematicBody2D

#Enum will contain all different states of player movement and control
enum{
	groundREADY,
	groundPULL,
	airREADY,
	airPULL
}

#Landing on ground with gravity
const UP = Vector2(0,-1)
export var GRAVITY = 20

#Member variables
#motion tracking
var motion = Vector2(0.0, 1.0)
var controlled_motion = Vector2(0.0, 0.0)
var physics_motion = Vector2(0.0, 1.0)

#modifiable traits
export var baseSpeed = 250
export var jumpPower = 500

#state
var state = groundREADY
var hook

# Called when the node enters the scene tree for the first time.
func _ready():
	# creates the grappling hook as a child of the player
	var grapplingScene = load("res://PhysicsGrapplingHook.tscn")
	hook = grapplingScene.instance()
	add_child(hook)

# Input Callback should move player input to this
func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if not hook.shot:
			hook.shoot(event.position - self.position)
		elif hook.collided:
			if state == groundREADY:
				state = groundPULL
			elif state == airREADY:
				state = airPULL
			else:
				hook.shot = false
		else:
			hook.returning = true


#Physics call with time delta
func _physics_process(delta):
	
	motion.y += GRAVITY*delta*60
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -jumpPower
		else:
			motion.y = 1
	
	#state machine "switch" to organize controls and animation
	match state:
		groundREADY:
			ground_movement(delta)
		groundPULL:
			ground_movement(delta)
			if hook.collided:
				to_hook(delta)
			else:
				state = groundREADY
		airREADY:
			air_movement(delta)
		airPULL:
			air_movement(delta)
			if hook.collided:
				to_hook(delta)
			else:
				state = airREADY
	

	motion = move_and_slide(motion, UP)

func air_movement(delta):
	if Input.is_action_pressed('ui_right') and not Input.is_action_pressed("ui_left"):
		motion.x = baseSpeed*delta*60
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed('ui_right'):
		motion.x = -baseSpeed*delta*60
	else:
		motion.x = motion.x/1.25
		
	
func ground_movement(delta):
	if Input.is_action_pressed('ui_right') and not Input.is_action_pressed("ui_left"):
		motion.x = baseSpeed*delta*60
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed('ui_right'):
		motion.x = -baseSpeed*delta*60
	else:
		motion.x = motion.x/1.25
		
	
func to_hook(delta):
	motion = motion/2 + (hook.hookPos - self.global_position)*delta*60*hook.hookSpeed
