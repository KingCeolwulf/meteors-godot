extends Area2D

var vel = Vector2()
export var speed = 1000

func start_at(dir, pos):
	rotation = dir
	position = pos
	vel = Vector2(speed, 0).rotated(dir-PI/2)

func _process(delta):
	position += vel*delta

func _on_lifetime_timeout():
	queue_free()
