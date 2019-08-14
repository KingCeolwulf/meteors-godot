extends Area2D

export var rotation_speed = 2.6
export var thrust = 500
export var max_velocity = 500
export var friction = 0.65

var screensize = Vector2()
#var pos = Vector2()
var vel = Vector2()
var acc = Vector2()
var rot = 0

func _ready():
	screensize = get_viewport().size
	position = screensize/2
	 
	
func _process(delta):
	if Input.is_action_pressed("player_left"):
		rot -= rotation_speed * delta
	if Input.is_action_pressed("player_right"):
		rot += rotation_speed * delta
	if Input.is_action_pressed("player_thrust"):
		acc = Vector2(thrust, 0).rotated(rotation-PI/2)
	else:
		acc = Vector2(0,0)
		
	rotation = rot + PI/2
	acc += vel * -friction
	vel += acc * delta
	position += vel * delta
	
	if position.x > screensize.x:
		position.x = screensize.x
	if position.x < 0:
		position.x = 0
	if position.y > screensize.y:
		position.y = screensize.y
	if position.y < 0:
		position.y = 0

