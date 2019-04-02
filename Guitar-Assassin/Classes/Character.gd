extends KinematicBody2D

var type = ""
var tile_size = 32
var move_direction = Vector2(0,0)
var bounce_direction = Vector2(0,0)
var direction = 'right'
const HIT_TIMER_MAX = 25
var hit_timer = HIT_TIMER_MAX
var collision_state = false
var raycasts = { 'right': 'RayCastRight', 'left': 'RayCastLeft', 'up': 'RayCastUp', 'down': 'RayCastDown' }

# Character-specific variables:
var hp = 5
var speed = 40

signal health_changed

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
	var collision = move_and_collide(move_direction.normalized() * delta * speed)
	if collision:
		if hit_timer >= HIT_TIMER_MAX:
			var colliding_body = collision.collider
			var node_name = colliding_body.get_name()
			if node_name != "TileMap" && node_name != "Kaughtabaw":
				hp -= 1
				emit_signal("health_changed", hp)
				bounce_direction = transform.origin - colliding_body.transform.origin
				hit_timer -= 1
				var character = get_parent().get_node(node_name)
				if character.type == "Enemy" || character.type == "Boss":
					print("A")
					character.use_weapon()

	if hit_timer > 0 and hit_timer < HIT_TIMER_MAX:
			hit_timer -= 1

	elif hit_timer <= 0:
		hit_timer = HIT_TIMER_MAX
		bounce_direction = Vector2(0,0)
		
	if type == "Enemy":
		print(hp)
		

func _on_Character_health_changed():
#	pass # Replace with function body.
	get_node("/root/Game/player").up
