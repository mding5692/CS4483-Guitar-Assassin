#code from http://kidscancode.org/blog/2018/02/godot3_kinematic2d/
extends KinematicBody2D

var speed = 750
var velocity = Vector2()

func bullet_start_position(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()