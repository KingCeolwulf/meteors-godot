extends KinematicBody2D

var vel = Vector2()
var rot_speed

func _ready():
	randomize()
	vel = Vector2(rand_range(30,100), 0).rotated(rand_range(0, 2*PI))
	rot_speed = rand_range(-2,2)
	
func _process(delta):
	rotation += rot_speed * delta
	move_and_collide(vel*delta)