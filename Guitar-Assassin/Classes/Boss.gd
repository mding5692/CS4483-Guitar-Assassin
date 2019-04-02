extends "res://Classes/Enemy.gd"

func _ready():
	hp = 50
	type = "Boss"
	speed = 30
	$Axe/Sprite.visible = false

func use_weapon():
	print("B")
	$Axe/Sprite.visible = true
	$Axe/anim.play("swingup")
	print("C")