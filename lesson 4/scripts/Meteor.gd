extends KinematicBody2D

var textures = {"big":['res://art/big1.png','res://art/big2.png',
						'res://art/big3.png','res://art/big4.png'],
				"med":['res://art/med1.png','res://art/med2.png'],
				"small":['res://art/small1.png','res://art/small2.png'], 
				"tiny":['res://art/tiny1.png','res://art/tiny2.png']
				}
var vel = Vector2()
var rot_speed
var screensize
var extents
export var bounce = 1.1

func _ready():
	randomize()
	screensize = get_viewport().size
	vel = Vector2(rand_range(130,200), 0).rotated(rand_range(0, 2*PI))
	rot_speed = rand_range(-2,2)
	init("big", screensize/2)

func init(size, pos):
	var texture = load(textures[size][randi() % textures[size].size()])
	$Sprite.texture=texture
	extents = texture.get_size() / 2
	var shape = CircleShape2D.new()
	shape.radius = min(extents.x, extents.y)
	var o = create_shape_owner(self)
	shape_owner_add_shape(o, shape)
	extents = texture.get_size()/2
	position = pos

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