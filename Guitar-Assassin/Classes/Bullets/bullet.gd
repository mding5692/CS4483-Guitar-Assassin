extends KinematicBody2D

var type = "bullet"

var speed = 0
var velocity = Vector2()
var damage = 0

func bullet_start_position(pos, dir):
	rotation = dir
	position = pos

func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(rotation)
	var collision = move_and_collide(velocity * delta)
	if collision:
		var node_name = collision.collider.get_name()
		if node_name != "TileMap" && node_name != "Kaughtabaw":
			if collision.collider.type != "bullet":
				var hurt_character = get_parent().get_node(node_name)
				hurt_character.hp -= damage
				print(damage)
				if hurt_character.type == "Enemy" || hurt_character.type == "Boss":
					hurt_character.spots_player()
					hurt_character.hurt_or_death_animation()
				elif hurt_character.type == "Player":
					hurt_character.player_is_hurt = true
			queue_free()
		else:
			queue_free()