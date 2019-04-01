#code from http://kidscancode.org/blog/2018/02/godot3_kinematic2d/
extends KinematicBody2D

var speed = 350
var velocity = Vector2()
var bullet_bounce = 0

func bullet_start_position(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.get_name() != "TileMap":
			queue_free()
		else:
			velocity = velocity.bounce(collision.normal)
			bullet_bounce += 1
			if bullet_bounce == 2:
				queue_free()