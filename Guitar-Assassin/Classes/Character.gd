# Tutorial comes from: http://kidscancode.org/blog/2018/01/godot3_inheritance/

extends KinematicBody2D

const TYPE = "PLAYER"
var tile_size = 32
var can_move = true
var move_direction = Vector2(0,0)
var bounce_direction = Vector2(0,0)
var direction = 'right'
const HIT_TIMER_MAX = 25
var hit_timer = HIT_TIMER_MAX
var collision_state = false
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
	var motion
	if hit_timer == HIT_TIMER_MAX:
		motion = move_direction.normalized() * SPEED
	else:
		motion = bounce_direction.normalized() * SPEED * 1.5
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

func damage(delta):
	"""if hit > 0:
		hit -= 1
	for body in $hitbox.get_overlapping_bodies():
		print(body.get_name())
		if hit == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			hp -= body.get("DAMAGE")
			hit = 10
			bounce_direction = transform.origin - body.transform.origin
	"""
	var collision = move_and_collide(move_direction.normalized() * delta * SPEED)
	if collision:
		if hit_timer >= HIT_TIMER_MAX:
			hp -= 1
			print(hp)
			var colliding_body = collision.collider
			bounce_direction = transform.origin - colliding_body.transform.origin
			hit_timer -= 1

		print(hit_timer)
	if hit_timer > 0 and hit_timer < HIT_TIMER_MAX:
			hit_timer -= 1

	elif hit_timer <= 0:
		hit_timer = HIT_TIMER_MAX
		bounce_direction = Vector2(0,0)
		print("done")
