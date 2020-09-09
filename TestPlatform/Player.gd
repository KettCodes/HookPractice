extends KinematicBody2D

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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Input Callback should move player input to this
func _input(event: InputEvent):
	pass


#Physics call with time delta
func _physics_process(delta):
	
	motion.y += GRAVITY*delta*60
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -jumpPower
		else:
			motion.y = 1
		ground_movement(delta)
	else:
		air_movement(delta)
	
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
		
	
func get_pulled(pull):
	motion += pull
