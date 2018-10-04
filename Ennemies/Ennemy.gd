extends KinematicBody2D

export (int) var maxHealth
export (int) var health
export (int) var defense
export (int) var speed

export (float) var gunCooldown

var motion = Vector2()

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func control():
	pass

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	
	control()
	
	move_and_slide(motion)