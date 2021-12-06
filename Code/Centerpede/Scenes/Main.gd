extends Node

const SHROOM_PS: PackedScene = preload("res://Content/Mushroom/Mushroom.tscn")
const PLAYER_PS: PackedScene = preload("res://Content/Player/Player.tscn")
const SEGMENT_PS: PackedScene = preload("res://Content/Segment/Segment.tscn")


onready var PLAYER_FIELD := $PlayingField
var length: int = 3
func _ready():
	print("Hello World'")
	Spawn(PLAYER_PS, Vector2(100,200))
	randomize()
	for n in 8:
		var random_x: int = rand_range(0, get_viewport().size.x)
		var random_y: int = rand_range(0, get_viewport().size.y)
		Spawn(SHROOM_PS, Vector2(random_x/2, random_y/2))
	
# Generic Spawner
func Spawn(ps: PackedScene, position: Vector2):
	var item = ps.instance()
	item.position = position
	PLAYER_FIELD.add_child(item)

func SpawnCentipede(length: int):
	for n in length:
		Spawn(SEGMENT_PS,Vector2(100+n*12,16))

func _unhandled_key_input(_event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	


func _on_Timer_timeout():
	SpawnCentipede(length)
	length += 1

