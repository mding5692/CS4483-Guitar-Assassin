#code from http://kidscancode.org/blog/2018/02/godot3_kinematic2d/
extends KinematicBody2D

var type = "bullet"

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
			if collision.collider.type != "bullet":
				var hurt_character = get_parent().get_node(collision.collider.get_name())
				hurt_character.hp -= 1
				if hurt_character.type == "Enemy" || hurt_character.type == "Boss":
					hurt_character.spots_player()
			queue_free()
		else:
			velocity = velocity.bounce(collision.normal)
			bullet_bounce += 1
			if bullet_bounce == 2:
				queue_free()