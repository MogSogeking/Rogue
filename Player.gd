extends KinematicBody2D

signal shoot
signal healthChanged
signal dead

export (PackedScene) var Bullet
export (int) var speed
export (int) var health
export (int) var dexterity
export (float) var gunCooldown

var motion = Vector2()
var alive = true
var canShoot = true

func _ready():
	$GunTimer.wait_time = gunCooldown

func shoot():
	if canShoot: 
		canShoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated($Gun.global_rotation)
		emit_signal('shoot', Bullet, $Gun.global_position, dir)

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	
	$Gun.look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("right"):
		motion.x += 100
		
	if Input.is_action_pressed("left"):
		motion.x -= 100
		
	if Input.is_action_pressed("up"):
		motion.y -= 100
		
	if Input.is_action_pressed("down"):
		motion.y += 100
		
	if Input.is_action_pressed("click"):
		shoot()
	
	move_and_slide(motion)
	
func _on_GunTimer_timeout():
	canShoot = true