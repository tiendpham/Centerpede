extends Area2D

class_name Bullet

export var speed = 600.0
var player
func _process(delta_time):
	if position.y < 50:
		Kill()
		pass
	position.y -= speed * delta_time
func Kill():
	player.Reload(1)
	queue_free()
