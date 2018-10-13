extends KinematicBody2D

signal shoot
signal healthChanged

export (int) var maxHealth
export (int) var health
export (int) var defense
export (int) var speed

export (float) var gunCooldown

var motion = Vector2()
var direction = Vector2()
var target = null
var canShoot = true

func control():
	pass

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	
	control()
	
	move_and_slide(motion)

func die():
	queue_free()
	pass
	
func takeDamage(damage):
	var newHealth = health - damage
	emit_signal('healthChanged', maxHealth, health, newHealth)
	health = newHealth
	if(health <= 0):
		die()