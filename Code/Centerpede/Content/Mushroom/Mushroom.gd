extends Node2D
class_name Mushroom

onready var SPRITE = $AnimatedSprite
var health: int = 4 # 0 - 5

func TakeDamage(delta_damage: int):
		health -= delta_damage
		if health >= 0:
			SPRITE.frame = health
		else:
			queue_free()
			




func _on_Area2D_body_entered(body):
	if body is Bullet:	
		TakeDamage(1)
		body.Kill()
