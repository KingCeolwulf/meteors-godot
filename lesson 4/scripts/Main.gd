extends Node

export (PackedScene) var Mob

func _ready():
	for i in range(4):
		var a = Mob.instance()
		add_child(a)
		a.init("big", $spawn_locations.get_child(i).position)
		
