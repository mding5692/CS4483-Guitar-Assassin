# Tutorial comes from: http://kidscancode.org/blog/2018/01/godot3_inheritance/

extends KinematicBody2D

var tile_size = 32
var can_move = true
var move_direction = Vector2(0,0)
var direction = 'right'
var raycasts = { 'right': 'RayCastRight', 'left': 'RayCastLeft', 'up': 'RayCastUp', 'down': 'RayCastDown' }

# Character-specific variables:
var hp = 100
const SPEED = 0

func character_movement():
	var motion = move_direction.normalized() * SPEED * 1.5
	move_and_slide(motion, Vector2(0,0))
	
func sprite_direction():
	match move_direction:
		Vector2(0,-1):
			direction = "up"
		Vector2(0,1):
			direction = "down"
		Vector2(-1,0):
			direction = "left"
		Vector2(1,0):
			direction = "right"