extends KinematicBody2D

class_name Bullet

export var speed = 600.0
var player
func _process(delta_time):
	if position.y < -50:
		Kill()
		pass
	#position.y -= speed * delta_time
	move_and_slide(Vector2.UP * speed)
	
	
func Kill():
	if is_instance_valid(player):
		player.Reload(1)
	
	queue_free()

