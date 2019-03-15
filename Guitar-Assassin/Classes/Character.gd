#	Character class
#	To inherit or use this class:
#	extends res://Classes/Character.gd
#	var Character = load("res://path/to/character.gd")
#	var character_node = Character.new()

extends Area2D

var tile_size = 32
var can_move = true
var direction = 'right'
var moves = { 'right': Vector2(1,0), 'left': Vector2(-1,0), 'up': Vector2(0, -1), 'down': Vector2(0,1) }
var raycasts = { 'right': 'RayCastRight', 'left': 'RayCastLeft', 'up': 'RayCastUp', 'down': 'RayCastDown' }

# Character-specific variables:
var hp = 100
var speed = 5

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func use_ability():
	pass
	

func move(dir):
	direction = dir
	if get_node(raycasts[direction]).is_colliding():
		return
	can_move = false
	$AnimationPlayer.play(direction)
	$MoveTween.interpolate_property(self, 'position', position, position + moves[direction] * tile_size, 0.8, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$MoveTween.start()
	return true

func _on_MoveTween_tween_completed(object, key):
	can_move = true
	pass # replace with function body
