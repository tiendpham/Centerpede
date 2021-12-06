extends KinematicBody2D
class_name Player

const BULLET_PS: PackedScene = preload("res://Content/Bullet/Bullet.tscn")

export var speed: float = 200 # Pixels / sec.
var direction: Vector2
var velocity: Vector2
var ammo_capacity: int = 1
var ammo_inventory: int = 5

func _process(delta_time):
	# Input Direction.
	var x: float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y: float = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction = Vector2(x, y)
	if direction.length() > 1:
		direction = direction.normalized()
	#position += direction * speed * delta_time

	# Input Fire.
	if Input.is_action_pressed("fire"):
		Fire()
	
	velocity = direction * speed
	move_and_slide(velocity)

func Fire():
	if ammo_inventory > 0:
		var bullet = BULLET_PS.instance()
		bullet.player = self
		bullet.position = position
		get_parent().add_child(bullet)
		ammo_inventory -= 1
		print("Fire!")

func Reload(count: int):
	if ammo_inventory < ammo_capacity:
		ammo_inventory += count
		print("Ammo Inventory: " + str(ammo_inventory))

func Kill():
	queue_free()
