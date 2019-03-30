extends "res://Classes/Bullets/bullet.gd"

const bullet_speed = 30
var bullet_bounce = 0

func _ready():
	pass

func _physics_process(delta):
	destroy_bullet(delta)

func destroy_bullet(delta):
	var collision = move_and_collide(bullet_speed * delta * Vector2(0,0).normalized())
	if collision:
		if collision.collider.get_name() == "TileMap":
			bullet_bounce += 1
			if bullet_bounce == 2:
				queue_free()