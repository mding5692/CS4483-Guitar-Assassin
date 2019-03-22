# Tutorial comes from: http://kidscancode.org/blog/2018/01/godot3_inheritance/

extends KinematicBody2D

var tile_size = 32
var can_move = true
var move_direction = Vector2(0,0)
var direction = 'right'
#var moves = { 'right': Vector2(1,0), 'left': Vector2(-1,0), 'up': Vector2(0, -1), 'down': Vector2(0,1) }
var raycasts = { 'right': 'RayCastRight', 'left': 'RayCastLeft', 'up': 'RayCastUp', 'down': 'RayCastDown' }

# Character-specific variables:
var hp = 100
const SPEED = 0


func use_ability():
	pass

"""func move(dir):
	direction = dir
	if get_node(raycasts[direction]).is_colliding():
		return
	can_move = false
	$AnimationPlayer.play(direction)
	$MoveTween.interpolate_property(self, 'position', position, position + moves[direction] * tile_size, 0.1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$MoveTween.start()
	return true

func _on_MoveTween_tween_completed(object, key):
	can_move = true
	pass # replace with function body
"""
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