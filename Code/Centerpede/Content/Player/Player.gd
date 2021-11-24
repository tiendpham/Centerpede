extends KinematicBody2D
class_name Player

const BULLET_PS: PackedScene = preload("res://Scenes/Bullet.tscn")

var speed: float = 150 # Pixels / sec.
var direction: Vector2
var velocity: Vector2
var ammo_count: int = 1

func _process(delta_time):
	# Input Direction.
	var x: float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y: float = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction = Vector2(x, y)
	if direction.length() > 1:
		direction = direction.normalized()
	position += direction * speed * delta_time

	# Input Fire.
	if Input.is_action_pressed("fire"):
		Fire()

func Fire():
	if ammo_count > 0:
		var bullet: Bullet = BULLET_PS.instance()
		bullet.player = self
		bullet.position = position
		get_node("../Bullets/").add_child(bullet)
		ammo_count -= 1
		print("Fire!")

func Reload(count: int):
	ammo_count += count
	print("Ammo Count: " + str(ammo_count))
