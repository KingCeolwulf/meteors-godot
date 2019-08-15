extends KinematicBody2D

var vel = Vector2()
var rot_speed
var screensize
var extents
export var bounce = 1.1

func _ready():
	randomize()
	screensize = get_viewport().size
	extents = $Sprite.texture.get_size()
	vel = Vector2(rand_range(130,200), 0).rotated(rand_range(0, 2*PI))
	rot_speed = rand_range(-2,2)
	
func _process(delta):
	rotation += rot_speed * delta
	var collision = move_and_collide(vel*delta)

	if collision:
		vel += collision.normal * collision.collider.vel.length() * bounce
	
	if position.x < -extents.x/2:
		position.x = screensize.x + extents.x
	if position.x > screensize.x + extents.x:
		position.x = -extents.x/2
	if position.y < -extents.y:
		position.y = screensize.y
	if position.y > screensize.y + extents.y/2:
		position.y = -extents.y