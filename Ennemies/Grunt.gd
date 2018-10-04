extends "res://Ennemies/Ennemy.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var target = null
var direction = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func control():
	if target:
		direction = (target.global_position - global_position).normalized()
		motion = direction * speed


func _on_DetectRadius_body_entered(body):
	target = body

func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null