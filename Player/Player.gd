extends KinematicBody2D

signal shoot
signal healthChanged
signal dead

export (PackedScene) var Bullet

export (int) var maxHealth
export (int) var maxAttack
export (int) var maxDexterity
export (int) var maxDefense
export (int) var maxSpeed

export (int) var fullHealth
export (int) var attack
export (int) var dexterity
export (int) var defense
export (int) var speed

export (int) var baseSpeed
export (float) var gunCooldown

var health
var motion = Vector2()
var alive = true
var canShoot = true

func _ready():
	$GunTimer.wait_time = 1 / (gunCooldown + (6.5*dexterity / 20))
	health = fullHealth
	emit_signal('health_changed', fullHealth, fullHealth, fullHealth)

func shoot():
	if canShoot: 
		canShoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated($Gun.global_rotation)
		emit_signal('shoot', Bullet, $Gun.global_position, dir)

func takeDamage(dmg):
	var newHealth = health - dmg
	emit_signal('healthChanged', fullHealth, health, newHealth)
	health = newHealth
	if health <= 0:
		scene_res

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	
	$Gun.look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("right"):
		motion.x += baseSpeed
		
	if Input.is_action_pressed("left"):
		motion.x -= baseSpeed
		
	if Input.is_action_pressed("up"):
		motion.y -= baseSpeed
		
	if Input.is_action_pressed("down"):
		motion.y += baseSpeed
		
	if Input.is_action_pressed("click"):
		shoot()
	
	move_and_slide(motion)
	
func _on_GunTimer_timeout():
	canShoot = true