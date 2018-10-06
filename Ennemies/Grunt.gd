extends "res://Ennemies/Ennemy.gd"

export (PackedScene) var Bullet

func _ready():
	$GunTimer.wait_time = 1
	health = fullHealth

func shoot(dir):
	if canShoot: 
		canShoot = false
		$GunTimer.start()
		emit_signal('shoot', Bullet, $Gun.global_position, dir)

func control():
	if target:
		direction = (target.global_position - global_position).normalized()
		motion = direction * speed
		shoot(direction)
			

func _on_DetectRadius_body_entered(body):
	target = body

func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null
		
func _on_GunTimer_timeout():
	canShoot = true