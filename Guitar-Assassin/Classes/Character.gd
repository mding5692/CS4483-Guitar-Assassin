extends KinematicBody2D


var tile_size = 32
var move_direction = Vector2(0,0)
var bounce_direction = Vector2(0,0)
var direction = 'right'
const HIT_TIMER_MAX = 25
var hit_timer = HIT_TIMER_MAX
var collision_state = false
var raycasts = { 'right': 'RayCastRight', 'left': 'RayCastLeft', 'up': 'RayCastUp', 'down': 'RayCastDown' }

# Character-specific variables:
var hp = 100
var speed = 40

func use_ability():
	pass

func character_movement():
	var motion
	if hit_timer == HIT_TIMER_MAX:
		motion = move_direction.normalized() * speed
	else:
		motion = bounce_direction.normalized() * speed * 1.5
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
	var collision = move_and_collide(move_direction.normalized() * delta * speed)
	if collision:
		if hit_timer >= HIT_TIMER_MAX:
			hp -= 1
			print(hp)
			var colliding_body = collision.collider
			bounce_direction = transform.origin - colliding_body.transform.origin
			hit_timer -= 1

	if hit_timer > 0 and hit_timer < HIT_TIMER_MAX:
			hit_timer -= 1

	elif hit_timer <= 0:
		hit_timer = HIT_TIMER_MAX
		bounce_direction = Vector2(0,0)

